class VendorController < ApplicationController
  def index
    if(!cookies[:user_name].blank?)
      @message = 'Vendors'
      @log = true
    end
  end

  def cater
    if(!cookies[:user_name].blank?)
      @message = 'Catering'
      @log = true
    end
  end

  def dj
    if(!cookies[:user_name].blank?)
      @message = 'DJ'
      @log = true
    end
  end

  def decor
    if(!cookies[:user_name].blank?)
      @message = 'Decorations'
      @log = true
    end
  end

  def flower
    if(!cookies[:user_name].blank?)
      @message = 'Flowers'
      @log = true
    end
  end

  def officiant
    if(!cookies[:user_name].blank?)
      @message = 'Officiants'
      @log = true
    end
  end

  def photo
    if(!cookies[:user_name].blank?)
      @message = 'Photography/Videography'
      @log = true
    end
  end

  def transport
    if(!cookies[:user_name].blank?)
      @message = 'Transportation'
      @log = true
    end
  end

  def venue
    if(!cookies[:user_name].blank?)
      @message = 'Venues'
      @log = true
    end
  end

end
