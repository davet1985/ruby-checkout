require File.expand_path(File.dirname(__FILE__)) + '/basket.rb'

class Checkout

	attr_accessor :basket

	def initialize(promotional_rules)
		#sort the promotions by their apply_order
		#e.g. item promotions must be applied before basket promotions
	  promotional_rules.sort! { |x,y| y.apply_order <=> x.apply_order }
    @promotional_rules = promotional_rules
		@basket = Basket.new(@promotional_rules)
	end

	def scan(item)
		basket.add_item(item)
	end

  def item_count
    basket.item_count
  end

	def total
    basket.total
	end

end