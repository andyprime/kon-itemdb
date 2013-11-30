class Items extends Backbone.Collection
    
    model: Item
    url: 'server/items/'
    
    initialize: ->
    
    addOne: (item) ->
      view = new CommentView({model: item});
      $(@el).append(view.render().el);
    
    addAll: ->
      @collection.each(this.addOne);