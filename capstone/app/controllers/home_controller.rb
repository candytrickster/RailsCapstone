class HomeController < ApplicationController

  def home
    @date = cookies['user_date']
    @current_date = DateTime.now.strftime('%m/%d/%Y')
    # @d = Date.strptime(@date, '%m/%d/%Y')
    @d = Date.parse(@date)
    @d = @d.strftime('%m/%d/%Y')
  end
end
