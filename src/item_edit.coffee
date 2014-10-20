class EditItemView extends Backbone.View

  events:
    'submit form': 'saveChanges'
    'click .cancel-btn': 'close'

  render: ->
    @

  loadItem: (@item) ->
    console.log(@item)
    @$el.html(templates.edit_item.render(item: @item.toJSON()))
    @delegateEvents()
    @

  saveChanges: (e) =>
    e.preventDefault()
  
    data = 
      value: @_getValue('value')
      description: @_getValue('description')
      notes: @_getValue('notes')
      added_by: @_getValue('added_by')


     @item.save(data, {wait: true}).done @close
   
  close: =>
    @trigger('close')

  show: ->
    @$el.show()

  hide: ->
    @undelegateEvents()
    @$el.hide()

  _getValue: (name) ->
    raw = @$("[name=\"#{name}\"]").val()
    raw