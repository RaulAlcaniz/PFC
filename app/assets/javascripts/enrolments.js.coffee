# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#CheckClass = {
#  hideCheck: ->
#    $('#class').hide()
#,
#  replaceVarietyDiv: (data, requestStatus, xhrObject) ->
#    #alert('replaceVariett, Data:' + data)
#    $('#dogsVarieties').html(data).show()
#,
#  error: (xhrObj, textStatus, exception) ->
#    alert('Error!')
#,
#  CheckingClass: ->
#    dog_class = $('select#class :selected').val()
#    $.ajax({
#      url: '/dogs/update_varieties',
#      type: 'GET',
#      data: { selected_breed: breed },
#      dataType: 'html',
#      timeout: 5000,
#      success: ShowVariety.replaceVarietyDiv,
#      error: ShowVariety.error
#    })
#,
#  setup: ->
#    $(document).on('change', '#class', CheckClass.CheckingClass)
#}
#$(CheckClass.setup)