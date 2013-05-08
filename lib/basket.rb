class Basket

	attr_accessor :total_price, :contents

	def initialize(promotional_rules)
		@total_price = 0.00
		@contents = Array.new()
		@promotional_rules = promotional_rules
	end

	def add_item(item)
		@contents << item
	end

	def total
		#item promotions must be calculated before the total is added up
		apply_item_promotions
		#add up the prices
		contents.each do |i|
			@total_price += i.price.to_f
		end
		#finally apply any basket promotions
		apply_basket_promotions
		return total_price.round(2)
	end

	def item_count
		return contents.length
	end

	def apply_item_promotions
    @promotional_rules.each do |pr|
      pr.apply(self) if pr.is_a? ItemPromotion
    end
	end

	def apply_basket_promotions
    @promotional_rules.each do |pr|
      pr.apply(self) if pr.is_a? BasketPromotion
    end		
	end

end