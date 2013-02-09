class @Gui

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)

  showPosts: (posts) =>
    $(".show-post").remove()
    $(".new-post").remove()
    console.log(posts[0].cid)
    element = @createElementFor("#posts-list-template", posts : posts)
    $(".main").append(element)

    for post in posts
      do (post) =>
        showPostLinkElement = $("a#show-post-#{post.id}")
        showPostLinkElement.click( => @showPostClicked(post))
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