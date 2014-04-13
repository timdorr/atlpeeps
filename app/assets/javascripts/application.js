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