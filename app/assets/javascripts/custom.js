$(document).ready(function() {
  $('.datepicker').datepicker({
    dateFormat: "dd-mm-yy", 
    minDate: new Date()
  });
  $('.name').autocomplete({
    source: $('.name').data('autocomplete-source')
  });
});