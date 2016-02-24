class VendorController < ApplicationController
  def index
    if(!cookies[:user_name].blank?)
      @message = 'Vendors'
      @log = true
    end
  end
end
