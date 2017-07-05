# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@atleast_one_field = (img_id) ->
  console.log(img_id)
  name = $('#new_name_field_'+img_id).val()!= ''
  image = $('#new_name_field_'+img_id).val()!= ''
  if !name || !image
    $('#change_submit_btn'+img_id).attr 'disabled', 'true'
  else
    $('#change_submit_btn'+img_id).removeAttr 'disabled'
  return
