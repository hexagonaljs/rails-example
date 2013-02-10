class @ServerSideAdapter
  constructor: ->
    console.log("ServerSideAdapter.constructor")

  loadPosts: =>
    console.log("serverSideAdapter.loadPosts")
    $.ajax(
      type: "GET"
      url: "/posts.json"
      success: (postsJson) =>
        @jsonPostsLoaded(postsJson)
      error: => @jsonPostsNotLoaded
    )

  jsonPostsLoaded: (jsonPosts)=>
    @postsLoaded(jsonPosts.map((jsonPost) => @buildPostFromJson(jsonPost)))

  buildPostFromJson: (jsonPost) =>
    post = new Post(jsonPost.id, jsonPost.name, jsonPost.content)

  postsLoaded: (posts) =>

  deletePost: (post) =>
    $.ajax(
      type: "DELETE"
      url: "/posts/#{post.id}.json"
      success: (json) =>
        @deletePostSucceeded(json)
      error: (json) =>
        @deletePostFailed(json)
    )
    
  deletePostSucceeded: (json) =>
    console.log(json)

  createNewPost: (post) =>
    $.ajax(
      type: "POST"
      url: "/posts.json"
      data: 
        post:
          name: post.name
          content: post.content
      success: (json) =>
        @createPostSucceeded(json)
      error: (json) =>
        @createPostFailed(json)
    )

  createPostSucceeded: (json) =>
    console.log(json)

  createPostFailed: (json) =>
    console.log (json)