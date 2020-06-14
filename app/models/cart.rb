class Cart < ApplicationRecord

    has_many :lineitems, dependent: :destroy
    
    def add_item(phone_id)
        current_item = self.lineitems.find_by(phone_id: phone_id)
        if current_item
            current_item.quantity += 1
        else
            current_item = self.lineitems.build(phone_id: phone_id)
        end
        current_item
    end
    
    def total_price
        lineitems.to_a.sum{|item| item.item_total_price}
    end
    
end
