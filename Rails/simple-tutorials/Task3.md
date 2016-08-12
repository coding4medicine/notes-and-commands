# Set up recurring payment with Stripe


## Single stripe charge


## Set up rails and devise Task1

~~~~~~
rails new blog
cd blog
bundle install
rails generate scaffold Post name:string title:string content:text
echo "gem 'devise'" >> Gemfile
echo "gem 'stripe'" >> Gemfile
bundle install
rails generate devise:install
rails generate devise user
rake db:migrate
~~~~~~

##  Create controller for stripe charges

~~~~~~
rails generate controller charges new create
~~~~~~

In app/controllers/charges_controller.rb,
keep new as it is, but change create to -

~~~~~~
def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
~~~~~~

In app/views/charges/new.html.erb -

~~~~~~
<%= form_tag charges_path do %>
  <article>
    <% if flash[:error].present? %>
      <div id="error_explanation">
        <p><%= flash[:error] %></p>
      </div>
    <% end %>
    <label class="amount">
      <span>Amount: $5.00</span>
    </label>
  </article>

  <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
          data-key="<%= Rails.configuration.stripe[:publishable_key] %>"
          data-description="A month's subscription"
          data-amount="500"
          data-locale="auto"></script>
<% end %>
~~~~~~


In app/views/charges/create.html.erb,

~~~~~~
<h2>Thanks, you paid <strong>$5.00</strong>!</h2>
~~~~~~


In config/routes.rb -

comment out -
~~~~~~
#  get 'charges/new'
#  get 'charges/create'
~~~~~~

add -
~~~~~~
  resources :charges
~~~~~~


7. add stripe keys in config/initializer/stripe.rb

~~~~~~
Rails.configuration.stripe = {
  :publishable_key => 'pk_test_xxxxx',
  :secret_key      => 'sk_test_xxxxx'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
~~~~~~



~~~~~~
rails s -b 0.0.0.0 -p 80
~~~~~~

go to -> http://c4m.com:xxxx/charges/new/

credit card number - 4242424242424242, expiration in future, any three digit number.





## Single pay with payola 

This demo installs payola-based single stripe payment.

1.	rails new D-payola-single-pay



## Stripe subscription system along with devise - Koudoku


1.	rails new E-koudoku
2.	vi Gemfile --> add  -- gem 'devise', gem 'koudoku'
3.	bundle install
4.	rails generate devise:install
        rails generate devise user
	rails generate koudoku:install user (answer Y to all questions)
	rails generate scaffold Post name:string title:string content:text
	rake db:migrate


5.	create plans from 'rails console'

irb(main):> Plan.create({name:'platinum', price: 29.99, interval: 'month', stripe_id: 'platinum', features: 'none', display_order: 1})

6.	In app/helper/application_helper.rb,

module ApplicationHelper
    include Koudoku::ApplicationHelper
end

7.	In views/layout/application.html.erb, add -

	<%= yield :koudoku %>

---
undefined method `plan_price'

https://github.com/andrewculver/koudoku/issues/121

---


before </head>

9.	in views/posts/index.html.erb, add

<%= link_to 'Pricing', main_app.pricing_path %>

10.	add stripe keys in config/initializer/koudoku.rb or in environment variable




