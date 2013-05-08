require 'minitest/autorun'

require File.expand_path(File.dirname(__FILE__)) + '/../lib/checkout.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/item.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/promotion.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/basket_promotion.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/item_promotion.rb'

describe Checkout do

	before do
		@promotional_rules = Array.new()
    @promotional_rules << BasketPromotion.new(60, 0.1)
    @promotional_rules << ItemPromotion.new("001", 2, 8.5)
  end

	describe :total do
		it "should return a float" do
			co = Checkout.new(@promotional_rules)
			(co.total.is_a? Float).must_equal(true)
		end
	end

	describe :scan do
		it "should add one item to the basket" do
			co = Checkout.new(@promotional_rules)
			item1 = Item.new("001", "Travel Card Holder", 9.25)
			co.scan(item1)
			co.item_count.must_equal(1)
		end
	end

	describe :item_count do
		it "should return 1" do
			co = Checkout.new(@promotional_rules)
			item1 = Item.new("001", "Travel Card Holder", 9.25)
			co.scan(item1)
			co.item_count.must_equal(1)
		end
	end

	describe :total do
		it "should return total 9.25" do
			co = Checkout.new(@promotional_rules)
			item1 = Item.new("001", "Travel Card Holder", 9.25)
			co.scan(item1)
			co.total.must_equal(9.25)
		end
	end
  
end