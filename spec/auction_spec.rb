require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
  context 'initialize' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    it "exists and has readable attributes" do
      expect(auction).to be_a(Auction)
      expect(auction.items).to eq([])
    end
  end

  context'Object Methods' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    auction.add_item(item1)
    auction.add_item(item2)

    it "adds items and lists their names" do
      expect(auction.items).to eq([item1, item2])
      expect(auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end
end
