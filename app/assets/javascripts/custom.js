$(document).ready(function() {
  $('#event_starts_at').datepicker({
    dateFormat: "dd-mm-yy", 
    minDate: new Date()
    });
  $('.alert').delay(3000).fadeOut();
});