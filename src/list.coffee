class ListView extends Backbone.View

  className: 'list-pane'

  initialize: (options, sub) =>
    @searchController = new ListOptionsView()
    @rows = []
    
    @listenTo @searchController, 'search', @performSearch
    @listenTo @collection, 'sync', @renderRows

  render: =>
    @$el.html(templates.list.render())
    @searchController.setElement(@$('.search-options')).render()
    @

  renderRows: =>
    _.each @rows, (x) => 
      @stopListening(x, 'details')
      x.remove()
    @rows = []

    if @searchOptions? and _.size(@searchOptions) > 0
      filters = []
      if @searchOptions.tags?
        filters.push(@_filterTags)
      if @searchOptions.text?
        filters.push(@_filterText)
      
      toShow = @collection.clone()
      toShow = new Items(toShow.filter(filter)) for filter in filters
    else
      toShow = @collection

    toShow.each((x) => @appendItem(x))

    @

  performSearch: (@searchOptions) =>
    # search pane has triggered indicating a change in search terms
    @renderRows()

  appendItem: (item) =>
    controller = new ItemRowView({model: item})
    @listenTo(controller, 'details', @onDetail)
    @rows.push(controller)
    @$('.item-list').append(controller.el)

  _filterText: (item) =>
    x = item.get('description').toLowerCase().indexOf(@searchOptions.text.toLowerCase())
    y = item.get('notes').toLowerCase().indexOf(@searchOptions.text.toLowerCase())
    x >= 0 or y >= 0

  _filterTags: (item) =>
    itemTags = _.map(item.get('tags'), (x) -> x.toLowerCase())
    for tag in @searchOptions.tags
      unless tag.toLowerCase() in itemTags
        return false
    return true

  hide: ->
    @$el.hide()

  show: ->
    @$el.show()

  onDetail: (id) ->
    console.log('Yay!', id)