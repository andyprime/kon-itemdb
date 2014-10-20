class Item extends Backbone.Model
  idAttribute: 'item_id'

  # initialize: (attributes, options) ->
  #   # console.log('const', attributes)
  #   # console.log(options)
  #   super

  validate: (attr, options) ->
    unless attr.item_number?
      return "Must at least have an item number"

  hasTags: (tagList) ->
    myTags = @get('tags')
    
    for tag in tagList
      if tag not in myTags
        return false
    true

  parse: (response, options) ->
    # console.log('Parse', response)
    response.item_number = parseInt(response.item_number, 10)
    response