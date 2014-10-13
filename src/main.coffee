class MainView extends Backbone.View

  el: 'body'

  events:
    'click .options li': 'menuSelect'

  pages:
    'list': ListView
    'add': AddItemView

  initialize: =>
    @selectedPage = 'list'
    @items = new Items()
    @items.fetch()

    for id, view of @pages
      @pages[id] = new view({collection: @items})

    # doing this with @listenTo cuases one of those mysterious "object has no method apply" errors
    $(window).on('resize', @resize)
    @render()

  render: =>
    @$el.html templates.main.render()
    @resize()

    for id, page of @pages
      @$('.content-pane').append(page.render().el)
      page.hide()
    @nav(@selectedPage)

  menuSelect: (event) =>
    page = $(event.target).attr('page')
    if page?
      @nav(page)

  onNav: (options) =>
    console.log('onNav', options)

  nav: (@selectedPage) =>
    page.hide() for id, page of @pages
    @pages[@selectedPage].show()    

  resize: ->
    # note that this gets the viewport height
    windowHeight = $(window).height()
    headerHeight = $('.banner').outerHeight() + $('.options').outerHeight()
    contentHeight = windowHeight - headerHeight

    $('.content-pane').height(contentHeight)