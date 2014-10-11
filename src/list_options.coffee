class ListOptionsView extends Backbone.View

  className: 'search-pane'

  events:
    'keyup input[name="text-search"]': 'doSearch'
    'click .delete-tag-btn': 'deleteTag'

  initialize: =>
    @listenTo Backbone, 'select_tag', @addTag
    @tags = []
    @render()

  render: ->
    @$el.html(templates['list_options'].render())
    @

  doSearch: =>
    text = @_getValue('text-search')
    options = {}
    options.text = text if text isnt ''
    options.tags = @tags if @tags.length > 0

    @trigger 'search', options      

  addTag: (tag) =>
    @tags.push(tag)
    @$('.tag-box').append(templates['selected_tag'].render(tagName: tag))
    @doSearch()

  deleteTag: (e) =>
    e.preventDefault()
    target = $(e.target)
    tag = target.attr('data-tag')
    @tags = _.without(@tags, tag)
    target.parent().remove()
    @doSearch()

  _getValue: (name) ->
    raw = @$("[name=\"#{name}\"]").val()
    raw