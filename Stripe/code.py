#!/usr/bin/env python

import stripe


# Set your secret key: remember to change this to your live secret key in production
stripe.api_key = "sk_test_rgfftf6sns426e22w2mw2m2"

stripe.Customer.create(
  source= "tok_1OgIlDSDDSFFaaKPesPD",
  plan=103,
  email="payinguser@example.com"
)



