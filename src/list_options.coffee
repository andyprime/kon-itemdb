class ListOptionsView extends Backbone.View

  initialize: =>
    @render()

  render: ->
    @$el.html(templates['list_options'].render())
    @
