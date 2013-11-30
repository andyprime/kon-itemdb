class Item extends Backbone.Model
  initialize: ->

  validate: (attr, options) ->
    unless attr.item_number?
      return "Must at least have an item number"