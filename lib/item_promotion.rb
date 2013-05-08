class ItemPromotion < Promotion

  attr_accessor :product_code, :minimum_order, :discount_price

	def initialize(product_code, minimum_order, discount_price)
    @product_code = product_code
    @minimum_order = minimum_order
    @discount_price = discount_price
	end

	def apply(basket)
		#counter for matching items, increment if basket item product code matches promotion product code
		item_count = 0
	  basket.contents.each do |i|
	  	item_count+=1 if i.product_code == product_code
	  end
	  #if we have found >= minimum_order matching products then set the new price
	  if item_count >= minimum_order
	  	basket.contents.each do |i|
	  		i.price = discount_price if i.product_code == product_code
	  	end
	  end
	end

end