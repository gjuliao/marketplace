class StripeService
    def initialize()
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    end

    def find_or_create_customer(user)
        if user.stripe_customer_id.present?
            stripe_customer = Stripe::Customer.retrieve(user.stripe_customer_id)
        else
            stripe_customer = Stripe::Customer.create({
                name: user.fullname,
                email: user.email,
            })
            user.update(stripe_customer_id: stripe_customer.id)
        end
        stripe_customer
    end

    def create_stripe_customer_card(params, stripe_customer)
        
        Stripe::Customer.create_source(
            stripe_customer.id,
            { source: 'tok_mastercard' }
        )
    end

    def create_stripe_charge(price, stripe_customer_id, card_id, project)
        Stripe::Charge.create({
            amount: price.to_f.round.to_i * 100,
            currency: 'usd',
            source: card_id,
            customer: stripe_customer_id,
            description: "Amount $#{price} charged for #{project.name}",
          })
    end

    def create_stripe_refund(stripe_charge_id, amount)
        Stripe::Refund.create({ charge: stripe_charge_id, amount: amount * 100 })
    end
end