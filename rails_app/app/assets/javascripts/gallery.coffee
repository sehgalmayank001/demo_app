# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@atleast_one_field = (img_id) ->
  console.log(img_id)
  name = $('#new_name_field_'+img_id).val()!= ''
  image = $('#new_image_field_'+img_id).val()!= ''
  if !name && !image
    $('#change_submit_btn'+img_id).attr 'disabled', 'true'
  else
    $('#change_submit_btn'+img_id).removeAttr 'disabled'
  return

@check_file_type = () ->
  filename = $('#import_csv_field').val()
  if filename.split('.')[1]!= 'csv'
    $('#import_btn').attr 'disabled', 'true'
    $('.import_file_error')[0].style.display = 'inline'
  else
    $('#import_btn').removeAttr 'disabled'
    $('.import_file_error')[0].style.display = 'none'
  return

@get_image_count= () ->
  if window.location.href.split('/').pop(-1) =='gallery'
    $('#img_cnt').css 'color', 'yellow'
    $('body').addClass("loading")
    $.ajax
      url: '/gallery/get_img_cnt'
      type: "GET"
      dataType: "json"
      success: (response) ->
        localStorage.setItem("img-cnt", null)
        localStorage.setItem("img-cnt", response)
        $('#img_cnt').append response
        $('#img_cnt').css 'color', 'green'
        return
      complete: ->
        $('body').removeClass("loading")
        return
  else
    $('#img_cnt').append localStorage.getItem("img-cnt")
  return
