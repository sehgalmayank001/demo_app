# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@stringlength = (inputtxt, minlength, maxlength) ->
  field = inputtxt
  mnlen = minlength
  mxlen = maxlength
  if field.length < mnlen or field.length > mxlen
    false
  else
    true

@validateEmail = (email) ->
  re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  re.test email

@allLetter = (inputtxt) ->
  letters = /^[A-Za-z]+$/
  if letters.test inputtxt
    true
  else
    false

@validpassword = (password) ->
  desired = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,10}/
  if desired.test password
    true
  else
    false

@alldigits = (num) ->
   /^\d+$/.test(num)

@validate_contact_form = ->
  contact_name = $('#person_name').val()
  contact_email = $('#person_email').val()
  contact_no = $('#person_mobile_no').val()
  desc = $('#person_description').val()
  mobile_no = name = email = true
  if contact_name != ''
    $('.name-error')[0].style.display = 'none'
    name = allLetter(contact_name)
    if !name
      $('.name-error')[0].style.display = 'inline-block'
  if contact_email != ''
    $('.email-error')[0].style.display = 'none'
    email = validateEmail(contact_email)
    if !email
      $('.email-error')[0].style.display = 'inline-block'
  if contact_no != ''
    $('.mobile-no-error')[0].style.display = 'none'
    $('.mobile-no-error-dig')[0].style.display = 'none'
    if !alldigits(contact_no)
      $('.mobile-no-error')[0].style.display = 'inline-block'
      $('.mobile-no-error-dig')[0].style.display = 'none'
      mobile_no = false
    else if alldigits(contact_no) and !stringlength(contact_no, 10, 10)
      $('.mobile-no-error')[0].style.display = 'none'
      $('.mobile-no-error-dig')[0].style.display = 'inline-block'
      mobile_no = false
  if name and email and mobile_no
    $('#contact_submit_btn').removeAttr 'disabled'
  else
    $('#contact_submit_btn').attr 'disabled', 'true'
  return


@validate_signup_form = ->
  signup_email = $('#user_email').val()
  if signup_email != ''
    $('.email-error')[0].style.display = 'none'
    email = validateEmail(signup_email)
    if !email
      $('.email-error')[0].style.display = 'inline-block'
  if email
    $('#signup_submit_btn').removeAttr 'disabled'
  else
    $('#signup_submit_btn').attr 'disabled', 'true'
  return

@match_passords = ->
  user_password = $('#user_password').val()
  user_password_confirmation = $('#user_password_confirmation').val()
  if user_password_confirmation == '' and user_password==''
    $('.pswd-cnfrm-error')[0].style.display = 'none'
    $('#change_pswd_btn').removeAttr 'disabled'
  if user_password_confirmation != '' and user_password!=''
        $('.pswd-cnfrm-error')[0].style.display = 'none'
        $('#change_pswd_btn').removeAttr 'disabled'
        pswd_cnfrm = user_password.localeCompare(user_password_confirmation)
        if pswd_cnfrm != 0
         $('.pswd-cnfrm-error')[0].style.display = 'inline-block'
         $('#change_pswd_btn').attr 'disabled', 'true'
  return

@double_pswd_check = ->
  match_passords()
  not_repeated()
  check_whitespace()
  if $('.error')[0].style.display != 'none' or $('.error')[1].style.display != 'none' or $('.error')[2].style.display != 'none'
    $('#change_pswd_btn').attr 'disabled', 'true'
  else
    $('#change_pswd_btn').removeAttr 'disabled'
  return

@not_repeated = ->
  user_password = $('#user_password').val()
  user_current_password = $('#user_current_password').val()
  if user_password!='' && user_current_password!='' && user_password.localeCompare(user_current_password)==0
    $('.pswd-same-error')[0].style.display = 'inline-block'
    $('#change_pswd_btn').attr 'disabled', 'true'
  else
    $('.pswd-same-error')[0].style.display = 'none'
    $('#change_pswd_btn').removeAttr 'disabled'
  return

@check_whitespace = ->
  user_password = $('#user_password').val()
  if user_password!='' and !(/^\S*$/.test(user_password))
    $('.whitespace-error')[0].style.display = 'inline-block'
    $('#change_pswd_btn').attr 'disabled', 'true'
  else
    $('.whitespace-error')[0].style.display = 'none'
    $('#change_pswd_btn').removeAttr 'disabled'
  return
