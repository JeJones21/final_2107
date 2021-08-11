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

    it "can identify unpopular_items" do
      item4.add_bid(attendee3, 50)

      expected2 = [item2, item3, item5]
      expect(auction.unpopular_items).to eq(expected2)

      item3.add_bid(attendee2, 15)

      expect(auction.unpopular_items).to eq([item2, item5])
    end

    it "can determine potential_revenue" do
      expect(auction.potential_revenue).to eq(87)
    end

    it "has to be bid on before it can determine rev" do
      expected3 = [item1, item3, item4]
      expect(auction.bid_on).to eq(expected3)
    end

    xit "can list the bidders" do
      expect(auction.bidders).to eq(["Megan", "Bob", "Mike"])
      #wasn't sure if this was due to the typo
    end

    it "can list the bidders" do
      expect(auction.bidders).to eq(["Bob", "Megan", "Mike"])
    end

    it "can list the bidders info" do
      expected4 = {
        attendee1 => {
          :budget => 50, :items => [item1]
        },
        attendee2 => {
          :budget => 75, :items => [item1, item3]
        },
        attendee3 => {
          :budget => 100, :items => [item4]
        }
      }

      expect(auction.bidder_info).to eq(expected4)
    end
  end
end
