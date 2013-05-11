class ItemPromotion < Promotion

  attr_accessor :product_code, :minimum_order, :discount_price, :apply_order

	def initialize(product_code, minimum_order, discount_price)
    @product_code = product_code
    @minimum_order = minimum_order
    @discount_price = discount_price
    @apply_order = 1
	end

	def apply(basket)
		#counter for matching items, increment if basket item product code matches promotion product code
		item_count = 0
		original_price = 0
	  basket.contents.each do |i|
	  	if i.product_code == product_code
	  		item_count += 1
	  		original_price = i.price
	  	end
	  end
	  #if we have found >= minimum_order matching products then set the new price
	  if item_count >= minimum_order
	  	basket.total_price -= (item_count*original_price) - (item_count*discount_price)
	  end
	end

end