class @Glue
  constructor: (@blog, @gui, @serverSideAdapter) ->
    After(@blog, "start", => @serverSideAdapter.loadPosts())
    After(@serverSideAdapter, "postsLoaded", (posts) => @blog.setPosts(posts))

    After(@blog, "setPosts", (posts) => @gui.showPosts(posts))

    After(@gui, "showPostClicked", (post) => @blog.showPost(post))
    After(@blog, "showPost", (post) => @gui.showPost(post))
    After(@blog, "showPost", (post) => @gui.hidePostsList())

    After(@gui, "showPostsClicked", => @blog.showPosts())
    After(@blog, "showPosts", => @gui.showPosts(@blog.allPosts()))