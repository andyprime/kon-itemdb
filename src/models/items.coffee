class Items extends Backbone.Collection
    model: Item
    url: 'server/items/'
    comparator: 'item_number'
