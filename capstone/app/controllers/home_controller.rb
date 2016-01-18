class HomeController < ApplicationController

  def home
    if(!cookies[:user_name].blank?)
      cookName = cookies[:user_name]
      cookFname = cookies[:user_fname]
      @message = 'Congratulations ' + cookName + ' and ' + cookFname + '!'
      @date = cookies['user_date']
      @current_date = DateTime.now.strftime('%m/%d/%Y')
      # @d = Date.strptime(@date, '%m/%d/%Y')
      @d = Date.parse(@date)
      @d = @d.strftime('%m/%d/%Y')
    end

  end

  def clearCookies
    cookies.delete :user_name
  end

end
