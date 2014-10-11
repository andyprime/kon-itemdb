class ListView extends Backbone.View

  className: 'list-pane'

  initialize: (options, sub) =>
    @collection.fetch()
    @listenTo @collection, 'sync', @render

    @searchController = sub
    
    @listenTo sub, 'search', @performSearch
    
    @rows = []

  render: =>
    _.each(@rows, (x) -> x.remove())
    @rows = []
    @$el.html('')


    if @searchOptions? and _.size(@searchOptions) > 0
      # console.log('Found something', @searchOptions)

      filters = []
      # ptions = @searchOptions
      if @searchOptions.tags?
        filters.push(@_filterTags)
      if @searchOptions.text?
        filters.push(@_filterText)
      
      # console.log(@collection)
      toShow = @collection.clone()
      for filter in filters
        # console.log(toShow.length)
        toShow = new Items(toShow.filter(filter))
      # console.log(toShow.length)
    else
      toShow = @collection

    toShow.each((x) => @appendItem(x))

    @

  # performSearch: _.bind(_.throttle(@_performSearch, 300), @)

  performSearch: (@searchOptions) =>
    # search pane has triggered indicating a change in search terms
    @render()

  appendItem: (item) =>
    controller = new ItemRowView({model: item})
    @rows.push(controller)
    @$el.append(controller.el)

  _filterText: (item) =>
    x = item.get('description').toLowerCase().indexOf(@searchOptions.text.toLowerCase())
    y = item.get('notes').toLowerCase().indexOf(@searchOptions.text.toLowerCase())
    console.log(x, y)
    x >= 0 or y >= 0

  _filterTags: (item) =>
    itemTags = _.map(item.get('tags'), (x) -> x.toLowerCase())
    for tag in @searchOptions.tags
      unless tag.toLowerCase() in itemTags
        return false
    return true