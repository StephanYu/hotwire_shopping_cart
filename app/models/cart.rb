class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :sneakers, through: :line_items

  def total_price
    line_items.sum(&:full_price)
  end

  def add_sneaker(sneaker)
    item = find_item(sneaker)
    if item.present?
      item.increment(:quantity)
    else
      item = line_items.build(sneaker: sneaker, quantity: 1)
    end
    item
  end

  def remove_sneaker(sneaker)
    item = find_item(sneaker)
    if item.present?
      item.decrement(:quantity) if item.quantity > 0
    end
    item.destroy if item.quantity == 0
    item
  end

  def sneaker_count(sneaker)
    line_items.find_by(sneaker: sneaker)&.quantity || 0
  end

  private
    def find_item(sneaker)
      line_items.find_by(sneaker: sneaker)
    end
end
