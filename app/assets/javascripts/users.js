//Document ready
$(document).on("turbolinks:load", function(){
  var theForm = $("#pro_form"),
      submitBtn = $("#form-signup-btn")
  //Set Stripe public key so we can send over
  Stripe.setPublishableKey( $("meta[name='stripe-key']").attr("content") )
  //When user clicks form submit button we will prevent form from sending to server
  submitBtn.click(function(event){

    event.preventDefault()

    //Collect the credit card fields
    var ccNum = $("#card_number").val(),
        cvcNum = $("#card_code").val(),
        expMonth = $("#card_month").val(),
        expYear = $("#card_year").val()

    //Send the card information to Stripe
    Stripe.createToken({
      number: ccNum,
      cvc: cvcNum,
      exp_month: expMonth,
      exp_year: expYear
    }, stripeResponseHandler)


  })

  //Stripe will send back a card token
  //Inject card token as a hidden field into our form
  //Submit form into our Rails app



})
