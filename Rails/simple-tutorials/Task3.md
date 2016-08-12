# Set up recurring payment with Stripe


## Single stripe charge


### Set up rails and devise Task1

~~~~~~
rails new blog
cd blog
echo "gem 'devise'" >> Gemfile
echo "gem 'stripe'" >> Gemfile
bundle install
rails generate scaffold Post name:string title:string content:text
rails generate devise:install
rails generate devise user
rake db:migrate
~~~~~~

###  Create controller for stripe charges

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


add stripe keys in config/initializer/stripe.rb

~~~~~~
Rails.configuration.stripe = {
  :publishable_key => 'pk_test_xxxxx',
  :secret_key      => 'sk_test_xxxxx'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
~~~~~~

or better - 
~~~~~~
Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
~~~~~~


~~~~~~
rails s -b 0.0.0.0 -p 80
~~~~~~

go to -> http://c4m.com:xxxx/charges/new/

credit card number - 4242424242424242, expiration in future, any three digit number.





## Stripe subscription system along with devise 

We will use haml here.

~~~~~~
rails new blog
cd blog
echo "gem 'devise'" >> Gemfile
echo "gem 'stripe'" >> Gemfile
echo "gem 'haml'" >> Gemfile
bundle install
rails generate scaffold Post name:string title:string content:text
rails generate devise:install
rails generate devise user
rake db:migrate
~~~~~~

In app/controllers/posts_controller.rb, add -  before_action :authenticate_user!
In config/routes.rb, add - root 'posts#index'
In config/initializers/devise.rb, change 'delete' to 'get'.



~~~~~~
rails generate controller charges new create
~~~~~~

In config/routes.rb, add -

~~~~~~
  resources :charges
  get 'plans' => 'charges#plans'
  post 'stripe_checkout' => 'charges#stripe_checkout'
  post 'subscription_checkout' => 'charges#subscription_checkout'
  post 'webhooks' => 'charges#webhooks'
~~~~~~



add stripe keys in config/initializer/stripe.rb

~~~~
Rails.configuration.stripe = {
  :publishable_key => 'pk_test_xxxxx',
  :secret_key      => 'sk_test_xxxxx'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
~~~~

or better -
~~~~
Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
~~~~


In app/controllers/charges_controller.rb, remove everything and add -

~~~~

~~~~

In app/views/charges folder, remove everything and add files -

index.html.haml
~~~~
~~~~

plans.html.haml
~~~~
~~~~




~~~~
rails s -b 0.0.0.0 -p 80
~~~~

go to -> http://c4m.com:xxxx/plans

Choose a plan. Use credit card number - 4242424242424242, expiration in future, 
any three digit number.


