require 'minitest/autorun'

require File.expand_path(File.dirname(__FILE__)) + '/../lib/checkout.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/item.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/promotion.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/basket_promotion.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/item_promotion.rb'

describe "Test Data" do
	
	before do
		@promotional_rules = Array.new()
	  @promotional_rules << BasketPromotion.new(60, 0.1)
	  @promotional_rules << ItemPromotion.new("001", 2, 8.5)
	end

	describe "Basket 001,002,003" do
		it "should have a total price of 66.78" do
			co = Checkout.new(@promotional_rules)
			item1 = Item.new("001", "Travel Card Holder", 9.25)
			item2 = Item.new("002", "Personalised cufflinks", 45)
			item3 = Item.new("003", "Kids T-Shirt", 19.95)
			co.scan(item1)
			co.scan(item2)
			co.scan(item3)
			co.total.must_equal(66.78)
		end
	end

	describe "Basket 001,003,001" do
		it "should have a total price of 36.95" do
			co = Checkout.new(@promotional_rules)
			item1 = Item.new("001", "Travel Card Holder", 9.25)
			item3 = Item.new("003", "Kids T-Shirt", 19.95)
			co.scan(item1)
			co.scan(item3)
			co.scan(item1)
			co.total.must_equal(36.95)
		end
	end

	describe "Basket 001,002,001,003" do
		it "should have a total price of 73.76" do
			co = Checkout.new(@promotional_rules)
			item1 = Item.new("001", "Travel Card Holder", 9.25)
			item2 = Item.new("002", "Personalised cufflinks", 45)
			item3 = Item.new("003", "Kids T-Shirt", 19.95)
			co.scan(item1)
			co.scan(item2)
			co.scan(item1)
			co.scan(item3)
			co.total.must_equal(73.76)
		end
	end

end