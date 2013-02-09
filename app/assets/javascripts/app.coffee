class @App
  constructor: ->
    blog = new Blog()
    gui = new Gui()
    serverSideAdapter = new ServerSideAdapter()

    glue = new Glue(blog, gui, serverSideAdapter)

    blog.start()




