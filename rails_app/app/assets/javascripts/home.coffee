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

@validate_contact_form = ->
  contact_name = $('#contact_us_name').val()
  contact_email = $('#contact_us_email').val()
  contact_no = $('#contact_us_mobile_no').val()
  desc = $('#contact_us_description').val()
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
    mobile_no = stringlength(contact_no, 10, 10)
    if !mobile_no
      $('.mobile-no-error')[0].style.display = 'inline-block'
  if desc != ''
    $('.desc-error')[0].style.display = 'none'
    desc = true
  else
    $('.desc-error')[0].style.display = 'inline-block'
  if name and email and mobile_no and desc
    $('#contact_submit_btn').removeAttr 'disabled'
  else
    $('#contact_submit_btn').attr 'disabled', 'true'
  return


@validate_signup_form = ->
  signup_email = $('#user_email').val()
  # user_password = $('#user_password').val()
  # user_password_confirmation = $('#user_password_confirmation').val()
  if signup_email != ''
    $('.email-error')[0].style.display = 'none'
    email = validateEmail(signup_email)
    if !email
      $('.email-error')[0].style.display = 'inline-block'
  # if user_password != ''
  #   $('.pswd-error')[0].style.display = 'none'
  #   pswd = stringlength(user_password, 6, 10) and validpassword(user_password)
  #   if !pswd
  #     $('.pswd-error')[0].style.display = 'inline-block'
  #  if user_password_confirmation != ''
  #       $('.pswd-cnfrm-error')[0].style.display = 'none'
  #       pswd_cnfrm = user_password.localeCompare(user_password_confirmation)
  #       if pswd_cnfrm != 0
  #        $('.pswd-cnfrm-error')[0].style.display = 'inline-block'
  if email
    $('#signup_submit_btn').removeAttr 'disabled'
  else
    $('#signup_submit_btn').attr 'disabled', 'true'
  return

@validate_signin_form = ->
  signup_email = $('#user_email').val()
  user_password = $('#user_password').val()
  if signup_email != ''
    $('.email-error')[0].style.display = 'none'
    email = validateEmail(signup_email)
    if !email
      $('.email-error')[0].style.display = 'inline-block'
  if user_password != ''
    $('.pswd-error')[0].style.display = 'none'
    pswd = true
  else
    $('.pswd-error')[0].style.display = 'inline-block'
  if email and pswd
    $('#signin_submit_btn').removeAttr 'disabled'
  else
    $('#signin_submit_btn').attr 'disabled', 'true'
  return
