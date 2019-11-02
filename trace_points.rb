class Post
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def publish
    puts "publish"
  end
end

Post.new("Ruby with AOP").publish

trace = TracePoint.new(:return) do |tp|
  if tp.defined_class == Post && tp.method_id == :publish
    puts "Post #{tp.binding.receiver.title} was published"
  end
end

trace.enable

Post.new("Ruby with AOP").publish

trace.disable

Post.new("Ruby with AOP").publish

#output:
# publish
# publish
# Post Ruby with AOP was published