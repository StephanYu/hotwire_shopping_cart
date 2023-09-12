class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :sneaker

  def full_price
    sneaker.price * quantity
  end
end
