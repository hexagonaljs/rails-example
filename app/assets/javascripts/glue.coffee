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

    After(@gui, "newPostClicked", => @blog.newPost())
    After(@blog, "newPost", => @gui.showNewPostForm())

    After(@gui, "commitNewPostClicked", (name, content) => @blog.createNewPost(name, content))
    After(@blog, "createNewPost", => @gui.showPosts(@blog.allPosts()))

    After(@gui, "editPostClicked", (post) => @blog.editPost(post))
    After(@blog, "editPost", (post) => @gui.showEditForm(post))

    After(@gui, "updatePostClicked", (post, name, content) => @blog.updatePost(post, name, content))
    After(@blog, "updatePost", => @gui.showPosts(@blog.allPosts()))

    After(@gui, "deletePostClicked", (post) => @blog.deletePost(post))
    After(@blog, "deletePost", => @gui.showPosts(@blog.allPosts()))