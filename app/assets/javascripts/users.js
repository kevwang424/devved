//Document ready
$(document).on("turbolinks:load", function(){
  var theForm = $("#pro_form"),
      submitBtn = $("#form-signup-btn")
  //Set Stripe public key so we can send over
  Stripe.setPublishableKey( $("meta[name='stripe-key']").attr("content") )
  //When user clicks form submit button we will prevent form from sending to server
  submitBtn.click(function(event){

    event.preventDefault()
    submitBtn.val("Processing").prop("disabled", true)
    //Collect the credit card fields
    var ccNum = $("#card_number").val(),
        cvcNum = $("#card_code").val(),
        expMonth = $("#card_month").val(),
        expYear = $("#card_year").val()

    //Use Stripe JS library to check for card errors
    var error = false

    //Validate card
    if (!Stripe.card.validateCardNumber(ccNum)){
      error = true
      alert("The credit card number appears to be invalid")
    }

    if (!Stripe.card.validateCVC(cvcNum)){
      error = true
      alert("The CVC number appears to be invalid")
    }

    if (!Stripe.card.validateExpiry(expMonth, expYear)){
      error = true
      alert("The expiration date appears to be invalid")
    }

    //Send the card information to Stripe
    if (error){
      //If there are errors do not send to Stripe
      submitBtn.val("Sign Up").prop("disabled", false)
    } else {
      Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler)
    }

    return false
  })

  function stripeResponseHandler(status, response){
    //Stripe will send back a card token
    var token = response.id

    //Inject card token as a hidden field into our form
    theForm.append($("<input type='hidden' name='user[stripe_card_token]' />").val(token))

    //Submit form into our Rails app
    theForm.get(0).submit()
  }







})
