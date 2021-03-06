//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$("#upload-image").on("click", function(e){
  e.preventDefault();

  $("#upload-form").find(":file").trigger("click");
});

$("#upload-form").on("change", ":file", function(e){
  $("#upload-form").trigger("submit");
});

$("#categories").on("click", function(e){
  var checkboxes = $(this).find(":checkbox");

  if (checkboxes.filter(":checked").length >= 3) {
    checkboxes.not(":checked").prop("disabled", true);
  } else {
    checkboxes.prop("disabled", false);
  }
}).trigger("click");