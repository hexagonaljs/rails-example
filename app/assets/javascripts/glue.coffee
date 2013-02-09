class @Glue
  constructor: (@blog, @gui, @serverSideAdapter) ->
    After(@blog, "start", => @serverSideAdapter.loadPosts())
    After(@serverSideAdapter, "postsLoaded", (posts) => @blog.setPosts(posts))

    After(@blog, "setPosts", (posts) => @gui.showPosts(posts))