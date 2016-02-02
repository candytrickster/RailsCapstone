class SeatingController < ApplicationController
  def index
    if(!cookies[:user_name].blank?)
      @message = 'Seating Chart'
      @log = true
    end
  end
end
