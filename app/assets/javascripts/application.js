// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {

  //toggles the complete list
  $('.show-tasks').on('click', function() {
    $(this).hide();
    $(this).closest('.display-buttons').find('.hide-tasks').show();
    $('.completed').show();
  });

  $('.hide-tasks').on('click', function() {
    $(this).hide();
    $(this).closest('.display-buttons').find('.show-tasks').show();
    $('.completed').hide();
  })

  //submits change of status for a task
  $('.edit_task').find('input[type=submit]').remove();
  $('.edit_task').find('input[type=checkbox]').click(function() {
    $(this).parent('form').submit();
  });

  // task list sorting
  $.expr[":"].containsNoCase = function(el, i, m) {
    var search = m[3];
    if (!search) return false;
    return new RegExp(search, "i").test($(el).text());
  };
  $("#filter").keyup(function() {
    var search = $(this).val();
    $("div.task-row").show();
    if (search) $("div.task-row").not(":containsNoCase(" + search + ")").hide();
  });
});
