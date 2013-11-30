class ItemRowView extends Backbone.View
  tagName: 'table',
  
  # className: 'clearfix'

  initialize: =>
    @render()
  
  render: ->
    item = @model.toJSON()
    @$el.html templates['item_row'].render
      item: item
      hasValue: item.value > 0