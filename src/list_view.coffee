class ListView extends Backbone.View

  initialize: =>
    @items = new Items()
    @items.fetch()
    @items.bind 'add', @appendItem

    @render()

  render: ->
    @$el.html(templates.list.render())
    @


  appendItem: =>
    console.log('Registered add item event')