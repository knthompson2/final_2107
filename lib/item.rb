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
    if @bids != {}
      @bids.max_by do |attendee, amount|
        amount
      end.last
    else
      0
    end
  end
end
