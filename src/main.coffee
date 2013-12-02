class MainView extends Backbone.View

  el: 'body'

  events:
    'click .options li': 'pageSelect'

  subPages:
    'list': ListView
    'add': AddItemView

  subOptions:
    'list': new ListOptionsView()

  initialize: =>
    @selectedPage = 'list'
    @items = new Items()

    for id, view of @subPages
      @subPages[id] = new view({collection: @items}, @subOptions[id])
      @listenTo(@subPages[id], 'navigate', @nav)

    # doing this with @listenTo cuases one of those mysterious "object has no method apply" errors
    $(window).on('resize', @resize)
    @render()

  render: =>
    $(@el).html templates.main.render()
    if @subOptions[@selectedPage]?
      @$('.sub-options').show()
      @$('.sub-options').html(@subOptions[@selectedPage].el)
    else
      @$('.sub-options').hide()
      @$('.sub-options').html('')
    @resize()
    @$('.content-pane').html(@subPages[@selectedPage].el)

  pageSelect: (event) =>
    page = $(event.target).attr('page')
    if page?
      @nav(page)

  nav: (page) =>
    if page?
      @selectedPage = page
      @render()
    else
      throw 'Cannot navigate to blank page'

  resize: ->
    # note that this gets the viewport height
    windowHeight = $(window).height()
    headerHeight = $('.banner').outerHeight() + $('.options').outerHeight()
    if $('.sub-options').is(':visible')
       headerHeight += $('.sub-options').outerHeight()
    contentHeight = windowHeight - headerHeight

    $('.content-pane').height(contentHeight)