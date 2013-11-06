class itemRowView extends Backbone.View
  tagName: 'tr',
  
  template: 'item_row'
      
  initialize: ->
    # annoying fellow doesn't want to be loaded at run time
    this.template = templates[@template]
  
  render: ->
    @$el.html(Mustache.render(this.template, this.model.toJSON()));
    @
  