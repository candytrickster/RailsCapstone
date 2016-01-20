class HomeController < ApplicationController

  def home
    if(!cookies[:user_name].blank?)
      cookName = cookies[:user_name]
      cookFname = cookies[:user_fname]
      @message = 'Congratulations ' + cookName + ' and ' + cookFname + '!'
      @date = ''+cookies[:user_date]
      @log = true
    end

  end

  def editCountdown

  end

end
