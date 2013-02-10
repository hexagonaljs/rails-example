class @Blog
  constructor: ->
    @posts = []
    console.log("Blog.constructor")
    @counter = 0

  allPosts: =>
    @posts

  start: =>
    console.log("blog started")

  setPosts: (posts) =>
    posts.each (post) => @appendNewPost(post)

  showPost: (post) =>
    console.log("blog.showPost: #{post.id}")

  showPosts: =>

  newPost: =>

  createNewPost: (name, content) =>
    post = new Post(null, name, content)
    @appendNewPost(post)

  appendNewPost: (post) =>
    @posts.push(post)
    post.setCid(@incrementCounter())

  incrementCounter: =>
    @counter += 1
    return @counter

  deletePost: (post) =>
    console.log("deleting post")
    @posts.remove(post)

  editPost: (post) =>

  updatePost: (post, name, content) =>
    post.update(name, content)

class @Post
  constructor: (@id, @name, @content) ->
    @cid = null

  setCid: (@cid) =>

  update: (@name, @content) =>

