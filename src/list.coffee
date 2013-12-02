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

    if @searchOptions? and (@searchOptions.text isnt '' or @searchOptions.tags.length > 0)
      console.log('Found something', @searchOptions)
      options = @searchOptions
      filterFn = (item) ->
        # TODO: make this suck less
        x = item.get('description').indexOf(options.text)
        y = item.get('notes').indexOf(options.text)
        x + y > 0
      toShow = new Items(@collection.filter(filterFn))
    else
      toShow = @collection

    toShow.each((x) => @appendItem(x))

    @

  performSearch: (options) =>
    console.log('Search', options)
    @searchOptions = options
    @render()

  appendItem: (item) =>
    controller = new ItemRowView({model: item})
    @rows.push(controller)
    @$el.append(controller.el)