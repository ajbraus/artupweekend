$(document).ready(function() {
  $('.datepicker').datepicker({
    dateFormat: "dd-mm-yy", 
    minDate: new Date()
  });
  $('#list').affix();
  $('.alert').delay(3000).fadeOut();
});