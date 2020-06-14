class Lineitem < ApplicationRecord
  belongs_to :phone
  belongs_to :cart
  
  belongs_to :order, optional: true
  
  def item_total_price
    self.phone.price * self.quantity
  end
  
end
