class Auction
  attr_reader :date, :items

  def initialize(date = Time.now.strftime("%d/%m/%Y"))
    @date = date
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.find_all do |item|
      item.bids == {}
    end
  end

  def potential_revenue
    @items.sum do |item|
      if item.bids != {}
        item.current_high_bid
      else
        0
      end
    end
  end

  def bidders
    @items.flat_map do |item|
      item.item_bidders
    end.uniq
  end

  def bidder_info
    info = {}
    @items.each do |item|
      item.list_bidders.each do |attendee|
        info[attendee] = {:budget => attendee.budget, :items => items_by_attendee(attendee)}
      end
    end
    info
  end

  def items_by_attendee(attendee)
    @items.find_all do |item|
      item.list_bidders.include?(attendee)
    end
  end

  def close_all_bidding
    @items.each do |item|
      item.close_bidding
    end
  end

  # def sell_items
  #   buyer = @items.find_all do |item|
  #     item.bids.max_by do |attendee, amount|
  #       if attendee.budget > amount
  #         amount
  #       else
  #     end
  #   end
  # end
end
