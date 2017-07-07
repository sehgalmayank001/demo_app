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
    $('.import_file_error')[0].style.display = 'inline-block'
  else
    $('#import_btn').removeAttr 'disabled'
    $('.import_file_error')[0].style.display = 'none'
  return
