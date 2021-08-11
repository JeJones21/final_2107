class Auction

  attr_reader :items
              # :bids

  def initialize
    @items = []
    # @bids = Hash.new(0)
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  # def add_bid(attendee, amount)
  #   @bids[attendee] += amount
  # end

  def unpopular_items
    @items.find_all do |item|
      item.bids.length < 1
    end
  end

  # def potential_revenue
  #   @items.find_all do |item|
  #     item.bids.max
  #   end
  # end

  def bid_on
    #helper method
    @items.find_all do |item|
      item.bids.length > 0
    end
  end

  def potential_revenue
    bid_on.sum {|item| item.current_high_bid}
  end

  def bidders
    #need to list the attendees by name
    # @attendees.map do |attendee|
    #   attendee.name
    #
    bidders = bid_on.flat_map do |item|
      item.bids.keys
    end
    bidders.map do |bidder|
      bidder.name
    end.uniq
  end

  def bidder_info
    #need to return a nested hash with attendees as keys and budget and items as values.
    expected = Hash.new([])

    @attendee.each do |attendee|
      attendee.name.each do |name|
        if expected[attendee.name].nil?
          expected[attendee.name] = [budget]
        else
          expected[attendee.actor].push(item
        end
      end
    end
    #not finished
    expected
  end
end
