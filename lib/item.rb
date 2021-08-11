class Item
  attr_reader :name, :bids, :bid_closed

  def initialize(name)
    @name = name
    @bids = {}
    @bid_closed = false
  end

  def add_bid(attendee, amount)
    if bid_closed == false
      @bids[attendee] = amount
    end
  end

  def current_high_bid
    @bids.max_by do |attendee, amount|
      amount
    end.last
  end

  def item_bidders
    @bids.map do |attendee, amount|
      attendee.name
    end
  end

  def list_bidders
    @bids.map do |attendee, amount|
      attendee
    end
  end

  def close_bidding
    @bid_closed = true
  end

end
