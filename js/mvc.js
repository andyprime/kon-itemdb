

var Item = Backbone.Model.extend({
    initialize: function(){
    }
});

var Items = Backbone.Collection.extend({
    model: Item,
    url: 'server/items/',
    
    initialize: function() {
    },
    
    addOne: function (item) {
        var view = new CommentView({model: item});
        $(this.el).append(view.render().el);
    },
    
    addAll: function () {
        this.collection.each(this.addOne);
    }  
});


var itemRowView = Backbone.View.extend({
    tagName: 'tr',
    
    template: window.vm_list_tpl,
        
    initialize: function() {
        // annoying fellow doesn't want to be loaded at run time
        this.template = window.vm_list_tpl;
    },
    
    render: function() {
        this.$el.html(Mustache.render(this.template, this.model.toJSON()));
        return this;
    }
});

var itemTableView = Backbone.View.extend({
    name: 'itemTableView',
    
    events: {
        'click .hobo':  'hobo'
    },
    
    initialize: function() {
        _.bindAll(this, 'render', 'addOne', 'addAll');
        
        this.collection.bind('reset', this.render);
    },
    
    addOne: function(item) {
        var view = new itemRowView({model: item});
        $(this.el).append(view.render().el);
    },
    
    addAll: function() {
        this.collection.each(this.addOne);
    },
    
    render: function() {
        $('#wait_row').show();
        this.addAll();
        $('#wait_row').hide();
    },
    
    hobo: function() {
        alert('HOBO!');
    }
});
