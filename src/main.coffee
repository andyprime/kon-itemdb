class MainView extends Backbone.View

  el: 'body'

  events:
    # 'click .btn-add': 'addItem'
    'click .options li': 'selectOption'


  subPages:
    'list': new ListView()
    'add': new AddItemView()

  subOptions:
    'list': new ListOptionsView()

  initialize: =>
    @selectedPage = 'list'

    # doing this with @listenTo cuases one of those mysterious "object has no method apply" errors
    $(window).on('resize', @resize)

    @render()
    # @resize()

  render: =>
    $(@el).html templates.main.render()
    console.log('--', @subOptions[@selectedPage])
    if @subOptions[@selectedPage]?
      console.log(1)
      @$('.sub-options').show()
      @$('.sub-options').html(@subOptions[@selectedPage].el)
    else
      console.log(2)
      @$('.sub-options').hide()
      @$('.sub-options').html('')
    @resize()
    @$('.content-pane').html(@subPages[@selectedPage].el)

  selectOption: (event) =>
    page = $(event.target).attr('page')
    if page?
      @selectedPage = page
      @render()

  resize: ->
    # note that this gets the viewport height
    windowHeight = $(window).height()
    headerHeight = $('.banner').outerHeight() + $('.options').outerHeight()
    if $('.sub-options').is(':visible')
       headerHeight += $('.sub-options').outerHeight()
    contentHeight = windowHeight - headerHeight

    $('.content-pane').height(contentHeight)