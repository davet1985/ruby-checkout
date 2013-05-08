require 'minitest/autorun'

require File.expand_path(File.dirname(__FILE__)) + '/../lib/basket.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/item.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/promotion.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/basket_promotion.rb'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/item_promotion.rb'

describe Basket do

	before do
		@promotional_rules = Array.new()
    @promotional_rules << BasketPromotion.new(60, 0.1)
    @promotional_rules << ItemPromotion.new("001", 2, 8.5)
    @basket = Basket.new(@promotional_rules)
  end

	describe :add_item do
		it "should add an item to the contents" do
			item = Item.new("001", "Travel Card Holder", 9.25)
			@basket.add_item(item)
			@basket.contents.length.must_equal(1)
		end
	end

	describe :item_count do
		it "should return 1" do
			item = Item.new("001", "Travel Card Holder", 9.25)
			@basket.add_item(item)
			@basket.item_count.must_equal(1)
		end
	end

	describe :total do
		it "should return 9.25" do
			item = Item.new("001", "Travel Card Holder", 9.25)
			@basket.add_item(item)
			@basket.total.must_equal(9.25)
		end
	end

	describe "apply basket promotion should give total of 81" do
		it "should have a total price of 66.78" do
			item = Item.new("002", "Personalised cufflinks", 45)
			@basket.add_item(item)
			@basket.add_item(item)
			@basket.total.must_equal(81)
		end
	end

	describe "apply item promotion should give total of 17" do
		it "should have a total price of 66.78" do
			item = Item.new("001", "Travel Card Holder", 9.25)
			@basket.add_item(item)
			@basket.add_item(item)
			@basket.total.must_equal(17)
		end
	end

end