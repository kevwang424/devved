class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_one :profile
  attr_accessor :stripe_card_token

  #If pro passes the validation (email, password, etc) then call Stripe
  #and tell them to set up a subscription upon charging the customers card
  #We reference the stripe_card_token since we never save the cards information
  #Stripe responds back with customer data and we store customer.id as the customer token in
  #our db and then save. œœ
  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
