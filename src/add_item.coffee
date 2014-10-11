class AddItemView extends Backbone.View

  className: 'add-item'

  events:
    'submit form': 'saveItem'
    'click .number-find-btn': 'findNumber'

  initialize: =>
    @render()

  render: ->
    @$el.html(templates['add_item'].render())
    @

  saveItem: (e) =>
    console.log('SAVE')
    e.preventDefault()
    @clearForm()

    data = 
      item_number: @_getValue('item_number')
      value: @_getValue('value')
      added_by: @_getValue('added_by')
      description: @_getValue('description')
      notes: @_getValue('notes')

    console.log data

    @collection.create data, 
      wait: true
      error: @saveFail
      success: @saveSuccess
    
  saveSuccess: (model, response, options) =>
    @trigger('navigate', 'list')

  saveFail: (model, xhr, options) =>
    console.log('save fail')
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

  findNumber: (e) =>
    i = 0
    console.log('begin')
    while i < @collection.length
      console.log(i, @collection.models[i].get('item_number'))
      if @collection.models[i].get('item_number') is i + 1
        i += 1
      else
        i += 1
        break
    console.log('Done', i)
    @$('input[name="item_number"]').val(i)

    