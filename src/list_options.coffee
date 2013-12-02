class ListOptionsView extends Backbone.View

  className: 'search-pane'

  events:
    'keyup input[name="text-search"]': 'doSearch'

  initialize: =>
    @listenTo Backbone, 'select_tag', @addTag
    @tags = []
    @render()

  render: ->
    @$el.html(templates['list_options'].render())
    @

  doSearch: =>
    text = @_getValue('text-search')
    @trigger 'search', 
      text: text
      tags: @tags

  addTag: (tag) =>
    @tags.push(tag)
    @doSearch()

  _getValue: (name) ->
    raw = @$("[name=\"#{name}\"]").val()
    raw