# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $("#breed").change ->
    alert('1')
    $.ajax({
      type : 'GET',
      #url : $(this).attr('href'),
      dataType : 'js',
      sucess : ((data) ->
        alert (data)
        $('#dogsVarieties').html(data)
      )
      error : (xhrObj, textStatus, exception) ->
        alert('Error!')
    })

    varieties = $('.variety2').html()
    alert ("Varieties: '#{varieties}'")

  #$('#variety').parent().hide()
#  $('#subvariety').parent().hide()
  #varieties = $('#variety2').html()
  #alert ("Varieties: '#{varieties}'")
    #$('#breed').change ->
#alert('Breed Cambia')
#    breed = $('#breed :selected').val()
#    alert("Raza id: '#{breed}'")


#    escaped_breed = breed.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g,'\\S1')
#    alert(varieties)
  #options = $(varieties).filter("optgroup[label='#{breed}']").html()
#    alert(options)
  #if options
  #$('#dog_dogable_type').html(options)
  #$('#dog_dogable_type').parent().show()
  #else
  #$('#dog_dogable_type').empty()
  #$('#dog_dogable_type').parent().hide()




#  $("#dog_dogable_id").change ->
#    breed = $('select#dog_dogable_id :selected').val()
     #alert(breed)
#    if(breed == "")
#      breed="0"
#    $.get('/dogs/update_varieties_select/' + breed, (data) ->
      #alert(data)
#      $("#dogsVarieties").html(data)
#    )
#    $.get('/dogs/update_subvarieties_select/' + 0, (data) ->
#      $("#dogsSubvarieties").html(data)
#    )


  #$('.variety').hide()
#varieties = $('.variety').html()
#alert (varieties)
#$('.breed').change ->
#   alert('hla')
#   breed = $('.breed :selected').html()
#   alert(breed)
#    escaped_breed = breed.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g,'\\S1')
#    alert(varieties)
#   options = $(varieties).filter("optgroup[label='#{breed}']").html()
#   alert(options)
#   if options
#     $('#dog_dogable_type').html(options)
#     $('.variety').show()
#   else
#     $('.variety').empty()
#     $('.variety').hide()



  #$('#dog_dogable_type').parent().hide()
  #varieties = $('#dog_dogable_type').html()
#  alert (varieties)
  #$('#dog_dogable_id').change ->
#    alert('hla')
    #breed = $('#dog_dogable_id :selected').text()
#    alert(breed)
#    escaped_breed = breed.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g,'\\S1')
#    alert(varieties)
    #options = $(varieties).filter("optgroup[label='#{breed}']").html()
#    alert(options)
    #if options
     #$('#dog_dogable_type').html(options)
    #$('#dog_dogable_type').parent().show()
    #else
    #$('#dog_dogable_type').empty()
    #$('#dog_dogable_type').parent().hide()