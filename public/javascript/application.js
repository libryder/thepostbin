$(document).ready(function() {
  $('#nav_tabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  })
  $(".collapse").collapse({
    toggle: false
  })
})