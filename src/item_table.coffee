class itemTableView extends Backbone.View
  name: 'itemTableView',
  
  events: 
    'click .hobo':  'hobo'
      
  initialize: ->
    # _.bindAll(this, 'render', 'addOne', 'addAll');
    this.collection.bind('reset', this.render);
  
  addOne: (item) =>
    view = new itemRowView({model: item});
    $(@el).append(view.render().el);
  
  addAll: =>
    @collection.each(this.addOne);
  
  render: =>
    $('#wait_row').show();
    @addAll();
    $('#wait_row').hide();
  
  
  hobo: ->
    alert('HOBO!');
