class AddItemView extends Backbone.View

  initialize: =>
    @render()

  render: ->
    @$el.html(templates['add_item'].render())
    @
