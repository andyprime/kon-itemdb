class ItemRowView extends Backbone.View
  tagName: 'li',
  
  initialize: =>
    @render()
  
  render: ->
    @$el.html(templates['item_row'].render({item: @model.toJSON()}))  