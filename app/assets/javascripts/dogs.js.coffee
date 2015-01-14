# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ShowVariety = {
  hideVariety: ->
    $('#dogsVarieties').hide()
  ,
  replaceVarietyDiv: (data, requestStatus, xhrObject) ->
    $('#dogsVarieties').html(data).show()
  ,
  error: (xhrObj, textStatus, exception) ->
    alert('Error!')
  ,
  getVarietiesDiv: ->
    breed = $('select#breed :selected').val()
    $.ajax({
      url: '/dogs/update_varieties',
      type: 'GET',
      data: { selected_breed: breed },
      dataType: 'html',
      timeout: 5000,
      success: ShowVariety.replaceVarietyDiv,
      error: ShowVariety.error
    })
  ,
  setup: ->
    $(document).on('change', '#breed', ShowVariety.getVarietiesDiv)
    $(document).on('change', '#breed', ShowSubvariety.hideSubvariety)
}
$(ShowVariety.setup)

ShowSubvariety = {
  hideSubvariety: (data) ->
    $('#dogsSubvariety').html(data)
    $('#dogsSubvariety').hide()
  ,
  replaceSubvarietyDiv: (data, requestStatus, xhrObject) ->
    $('#dogsSubvariety').html(data).show()
  ,
  error: (xhrObj, textStatus, exception) ->
    alert('Error!')
  ,
  getSubvarietyDiv: ->
    variety = $('select#variety :selected').val()
    $.ajax({
      url: '/dogs/update_subvarieties',
      type: 'GET',
      data: { selected_variety: variety },
      dataType: 'html',
      timeout: 5000,
      success: ShowSubvariety.replaceSubvarietyDiv,
      error: ShowSubvariety.error
    })
  ,
  setup: ->
    $(document).on('change', '#variety', ShowSubvariety.getSubvarietyDiv)
}
$(ShowSubvariety.setup)