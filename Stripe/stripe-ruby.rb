require "stripe"
Stripe.api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2"

$x=Stripe::Charge.retrieve(
  "ch_18hl572eZvKYlo2CGCNVjuJx",
  :api_key => "sk_test_BQokikJOvBiI2HlWgH4olfQ2"
)

print $x

