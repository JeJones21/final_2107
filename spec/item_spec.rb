require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  context 'Initialize' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    it "exists and has attributes" do
      expect(item1).to be_a(Item)
      expect(item2).to be_a(Item)
      expect(item1.name).to eq('Chalkware Piggy Bank')
    end
  end

  context 'Object Methods do' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')

    it "starts with zero bids" do
      expect(item1.bids).to eq({})
    end
  end
end
