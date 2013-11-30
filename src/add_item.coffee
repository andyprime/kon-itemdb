class AddItemView extends Backbone.View

  events:
    'submit form': 'saveItem'

  initialize: =>
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

    @collection.create data, 
      wait: true
      error: @saveFail
      success: @saveSuccess
    
  saveSuccess: (model, response, options) =>
    console.log('It worked, yo', response)

  saveFail: (model, xhr, options) =>
    console.log('Shit broke yo', xhr.responseJSON)

  _getValue: (name) ->
    raw = @$("[name=\"#{name}\"]").val()
    raw