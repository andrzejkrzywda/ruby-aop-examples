class Post
  def initialize(title)
    @title = title
  end

  def publish
    puts "publish"
  end
end


Post.new("Ruby without AOP").publish

module Logging

  def publish
    super
    puts "Post #{@title} was published"
  end

end

Post.prepend(Logging)
Post.new("Ruby with AOP").publish

#output:
# publish
# publish
# Post Ruby with AOP was published