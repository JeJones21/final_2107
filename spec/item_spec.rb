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
end
