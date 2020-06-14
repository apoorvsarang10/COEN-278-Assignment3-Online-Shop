class UserController < ApplicationController
  
  include CurrentCart
  before_action :set_cart
  
  def index
    
    @phones = Phone.all
    
  end
end
