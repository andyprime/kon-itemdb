class AddItemView extends Backbone.View

  className: 'add-item'

  events:
    'submit form': 'saveItem'

  initialize: =>
    @render()

  render: ->
    @$el.html(templates['add_item'].render())
    @

  saveItem: (e) =>
    e.preventDefault()
    @clearForm()

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
    @trigger('navigate', 'list')

  saveFail: (model, xhr, options) =>
    @setForm(xhr.responseJSON.msg)

  setForm: (message) ->
    @$('.form-message').html(message)
    @$('.form-message').show()

  clearForm: ->
    @$('.form-message').html('')
    @$('.form-message').hide()

  _getValue: (name) ->
    raw = @$("[name=\"#{name}\"]").val()
    raw