class @Blog
  constructor: ->
    @posts = []
    console.log("Blog.constructor")

  start: =>
    console.log("blog started")

  setPosts: (@posts) =>
    console.log(@posts)


class @Post
  constructor: (@title, @content) ->