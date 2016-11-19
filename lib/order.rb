require_relative 'menu'

class Order

  attr_reader :menu
  attr_accessor :basket

  def initialize(menu)
    @menu = menu
    @basket = {}
  end

  def add(dish, quantity)
    fail "Not a valid choice" if menu.does_not_contain?(dish)
    if basket[dish]
      basket[dish] = basket[dish] + quantity
    else
      basket[dish] = quantity
    end
  end

  def total
    total = 0
    basket.each do |dish,quantity|
      total += quantity * menu.list[dish]
    end
    total
  end

end