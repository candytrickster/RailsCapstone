class HomeController < ApplicationController

  def home
    if(!cookies[:user_name].blank?)
      cookName = cookies[:user_name]
      cookFname = cookies[:user_fname]
      @message = 'Congratulations ' + cookName + ' and ' + cookFname + '!'
      @date = ''+cookies[:user_date]
      @current_date = DateTime.now()
      # @d = Date.strptime(@date, '%m/%d/%Y')
      @d = Date.parse(@date)
      # @d = @d.strftime('%m/%d/%Y')
      @dd = cookies[:user_date][0..1]
      @mm = cookies[:user_date][3..4]
      @yyyy = cookies[:user_date][6..9]
      @log = true
      # parseInts(@dd, @mm, @yyyy)
      @what = @date.is_a?(String)
    end

  end

  def parseInts(dd,mm,yyyy)
    @dd = Integer(dd)
    @mm = Integer(mm)
    @yyyy = Integer(yyyy)
  end

end
