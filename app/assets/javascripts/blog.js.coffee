class @Blog
  constructor: ->
    @posts = []
    console.log("Blog.constructor")

  allPosts: =>
    @posts

  start: =>
    console.log("blog started")

  setPosts: (@posts) =>
    console.log(@posts)

  showPost: (post) =>
    console.log("blog.showPost: #{post.id}")

  showPosts: =>


class @Post
  constructor: (@id, @name, @content) ->