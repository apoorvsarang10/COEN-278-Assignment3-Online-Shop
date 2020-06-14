class Order < ApplicationRecord

    has_many :lineitems, dependent: :destroy
    
    PAYMENT_TYPES = ["Check", "Credit Card", "Venmo", "Paypal"]
    
    validates :name, :address, :email, presence: true
    
    validates :paytype, inclusion: PAYMENT_TYPES

    def add_items_from_cart(cart)
        cart.lineitems.each do |item|
            puts self.id
            puts item.cart_id
            puts item.order_id
            item.cart_id = nil
            item.order_id = self.id
            puts item.cart_id
            puts item.order_id
            item.save
        end
    end
    
    def total_price
        lineitems.to_a.sum{|item| item.item_total_price}
    end
end
