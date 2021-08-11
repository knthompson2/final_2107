class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
  end

  def current_high_bid
    @bids.max_by do |attendee, amount|
      amount
    end.last
  end
end
