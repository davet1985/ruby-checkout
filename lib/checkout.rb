require File.expand_path(File.dirname(__FILE__)) + '/basket.rb'

class Checkout

	attr_accessor :basket

	def initialize(promotional_rules)
    @promotional_rules = promotional_rules
		@basket = Basket.new(@promotional_rules)
	end

	def scan(item)
		basket.add_item(item)
	end

  def item_count
    return basket.item_count
  end

	def total
    return basket.total
	end

end