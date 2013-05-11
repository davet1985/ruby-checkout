class BasketPromotion < Promotion

  attr_accessor :minimum_spend, :discount_pct, :apply_order

	def initialize(minimum_spend, discount_pct)
    @minimum_spend = minimum_spend
    @discount_pct = discount_pct
    @apply_order = -1
	end

	def apply(basket)
		#adjust the basket total price if the minimum spend is met
    if basket.total_price > @minimum_spend
      basket.total_price = basket.total_price * (1-@discount_pct)
    end
	end

end