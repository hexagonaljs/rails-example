class @Gui

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)

  showPosts: (posts) =>
    console.log(posts)
    element = @createElementFor("#posts-list-template", posts : posts)
    $(".main").append(element)