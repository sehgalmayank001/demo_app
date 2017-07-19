// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require foundation
//= require home
//= require gallery
//= require turbolinks

$(document).on('turbolinks:load', function() {
  $(function(){ $(document).foundation(); });
  $( ".image-container" ).children().last().addClass('end');
  $( ".image-container" ).children().first().addClass('large-offset-1');
  $('.reveal').bind('closed.zf.reveal', function () {
    $(this).find('.formm')[0].reset();
    $(this).find(".error-container2").html("")
    $(this).find('.import_file_error')[0].style.display = 'none'
  });
   $('div[onchange]').trigger('onchange');
});
