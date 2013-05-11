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
		@total_price = 0.00
		contents.each do |i|
			@total_price += i.price.to_f
		end
		apply_promotions
		total_price.round(2)
	end

	def item_count
		contents.length
	end

	def apply_promotions
    @promotional_rules.each do |pr|
      pr.apply(self)
    end
	end

end