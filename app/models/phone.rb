class Phone < ApplicationRecord

    has_many :lineitems
    before_destroy :check_cart
    
    has_one_attached :image

    validates(:name, :image, :ram, :display, :memory, :processor, :front_camera, :back_camera, :price, presence: true )

    validates :ram, numericality: {greater_than_or_equal_to: 1}
    validates :ram, numericality: {less_than_or_equal_to: 64}

    validates :memory, numericality: {greater_than_or_equal_to: 1}
    validates :memory, numericality: {less_than_or_equal_to: 1024}

    #validates :image, allow_blank: true, format: {with: %r{\.(gif|jpg|jpeg|png)\Z}i, message: "must be GIF, JPG/JPEG, PNG images!"}

    def check_cart
        if self.lineitems.empty?
            return true
        end
        errors.add(:base, "Line Item present in the cart")
        return false
    end
end
