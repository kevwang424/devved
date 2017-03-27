//Fade out alert messages when they appear on a page
//Like in Users, the turbolinks:load is telling the document to fully complete
//loading before running any scripts after.

$(document).on("turbolinks:load", function(){
  $(".alert").delay(1000).fadeOut(5000)
})
