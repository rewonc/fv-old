Rails.configuration.stripe = {
  :publishable_key => Figaro.env.STRIPE_PUBLISHABLE_KEY,
  :secret_key      => Figaro.env.STRIPE_SECRET_KEY
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
