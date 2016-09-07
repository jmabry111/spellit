$(function() {
  $('[data-autosubmit]').on('change', function() {
    $(this).closest('form').submit();
  });
});
