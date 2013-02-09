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
    new Post(jsonPost.id, jsonPost.name, jsonPost.content)


  postsLoaded: (posts) =>
