class ItemRowView extends Backbone.View
  tagName: 'table',
  
  events:
    'click .taglink': 'selectTag'
    'click .item-number': 'itemDetails'
    
  initialize: =>
    @render()
  
  render: ->
    item = @model.toJSON()
    @$el.html templates['item_row'].render
      item: item
      hasValue: item.value > 0

  selectTag: (e) =>
    e.preventDefault()
    Backbone.trigger('select_tag', e.target.innerHTML)

  itemDetails: (e) =>
    e.preventDefault
    @trigger('details', @model.get('item_number'))