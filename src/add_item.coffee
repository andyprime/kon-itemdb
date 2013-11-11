class AddItemView extends Backbone.View

  events:
    'submit form': 'saveItem'

  initialize: =>
    console.log('add iten', @collection)
    @render()

  render: ->
    @$el.html(templates['add_item'].render())
    @

  saveItem: (e) =>
    e.preventDefault()

    data = 
      item_number: @_getValue('item_number')
      value: @_getValue('value')
      added_by: @_getValue('added_by')
      description: @_getValue('description')
      notes: @_getValue('notes')

    console.log('data', data)

    x = @collection.create(data)

    console.log('thingy', x)

    

  _getValue: (name) ->
    raw = @$("[name=\"#{name}\"]").val()
    raw