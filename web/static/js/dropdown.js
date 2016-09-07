$(function() {
  var dropdownToggle = "[data-role='dropdown-toggle']";
  var dropdown = "[data-role='dropdown']";
  var dropdownWrapper = "[data-role='dropdown-wrapper']";

  $(dropdownToggle).click(function() {
    $(this).next(dropdown).toggleClass("is-open");
  });

  $(document).click(function(event) {
    if (!$(event.target).closest(dropdownWrapper).length) {
      $(dropdown).removeClass("is-open");
    }
  });
});
