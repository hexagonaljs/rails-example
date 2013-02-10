class @Gui

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)

  showPosts: (posts) =>
    $(".posts-list").remove()
    $(".show-post").remove()
    $(".new-post").remove()
    $(".edit-post").remove()
    element = @createElementFor("#posts-list-template", posts : posts)
    $(".main").append(element)

    for post in posts
      do (post) =>
        showPostLinkElement = $("a#show-post-#{post.cid}")
        showPostLinkElement.click( => @showPostClicked(post))

        $("a#edit-post-#{post.cid}").click( => @editPostClicked(post))
        $("a#delete-post-#{post.cid}").click( => @deletePostClicked(post))
    $("#new-post").click(=> @newPostClicked())

  newPostClicked: =>

  showNewPostForm: =>
    $(".posts-list").remove()
    console.log("show new post form")
    $(".main").append(@createElementFor("#new-post-template"))
    $("#commit-new-post").click( 
      => @commitNewPostClicked($("#post_name").val(), $("#post_content").val())
    )

  commitNewPostClicked: (name, content) =>

  showPostClicked: (post) =>

  hidePostsList: =>
    $(".posts-list").remove()

  showPost: (post) =>
    element = @createElementFor("#show-post-template", post : post)
    $(".main").append(element)
    $("#show-all-posts").click => @showPostsClicked()

  showPostsClicked: =>

  editPostClicked: (post) =>

  showEditForm: (post) =>
    console.log("show edit form")
    $(".posts-list").remove()
    $(".main").append(@createElementFor("#edit-post-template", post : post))
    $("#update-post").click( 
      => @updatePostClicked(post, $("#post_name").val(), $("#post_content").val())
    )

  updatePostClicked: (post, name, value) =>

  deletePostClicked: (post) =>
