class ListView extends Backbone.View

  className: 'list-pane'

  initialize: =>
    console.log(@)
    @collection.fetch()
    @collection.bind 'add', @appendItem

    @render()

  render: ->
    @$el.html(templates.list.render())
    @


  appendItem: (item, items) =>
    controller = new ItemRowView({model: item})
    @$('ul').append(controller.el)