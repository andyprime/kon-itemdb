class ListView extends Backbone.View

  className: 'list-pane'

  initialize: =>
    @collection.fetch()
    @listenTo @collection, 'add', @appendItem

    @render()

  render: ->
    @

  appendItem: (item, items) =>
    console.log('append item')
    controller = new ItemRowView({model: item})
    @$el.append(controller.el)