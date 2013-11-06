class MainView extends Backbone.View

  el: 'body'

  events:
    'click .btn-add': 'addItem'


  subPages:
    'list': new ListView()

  initialize: =>
    console.log('Main init')

    @selectedPage = 'list'

    @render()

  render: =>
    console.log('We renderin')
    
    $(@el).append templates.main.render()

    console.log(@subPages)
    console.log(@selectedPage)
    
    @$('.content-pane').html(@subPages[@selectedPage].el)

  addItem: =>
    # something
