class Item extends Backbone.Model
  initialize: ->

  validate: (attr, options) ->
    unless attr.item_number?
      return "Must at least have an item number"

  hasTags: (tagList) ->
    myTags = @get('tags')
    console.log('myTags', myTags)

    for tag in tagList
      if tag not in myTags
        return false
    true