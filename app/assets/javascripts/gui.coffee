class @Gui

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)

  showPosts: (posts) =>
    $(".show-post").remove()
    console.log(posts)
    element = @createElementFor("#posts-list-template", posts : posts)
    $(".main").append(element)

    for post in posts
      do (post) =>
        showPostLinkElement = $("a#show-post-#{post.id}")
        console.log(showPostLinkElement)
        showPostLinkElement.click( => @showPostClicked(post))
        

    

  showPostClicked: (post) =>
    console.log("post clicked: #{post.id}")

  hidePostsList: =>
    console.log("gui.hidePostsList")
    $(".posts-list").remove()

  showPost: (post) =>
    element = @createElementFor("#show-post-template", post : post)
    $(".main").append(element)
    $("#show-all-posts").click => @showPostsClicked()

  showPostsClicked: =>


