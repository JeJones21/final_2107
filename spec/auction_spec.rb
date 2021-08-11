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

  context 'Object Build Bigger Auction' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    attendee3 = Attendee.new(name: 'Mike', budget: '$100')

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)

    it "can start without any bids" do
      expect(item1.bids).to eq({})
    end

    it "can add bids to items" do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expected = {
                  attendee2 => 20,
                  attendee1 => 22
      }
      expect(item1.bids).to eq(expected)
    end

    it "can test for highest bids" do
      expect(item1.current_high_bid).to eq(22)
    end
  end
end
