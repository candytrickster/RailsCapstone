class HomeController < ApplicationController

  def home
    if(!cookies[:user_name].blank?)
      @message = 'Congratulations ' + cookies[:user_name] + ' and ' + cookies[:user_fname] + '!'
      @date = ''+cookies[:user_date]
      @log = true
    end

  end

  def edit
    if(!cookies[:user_name].blank?)
      @message = 'Edit Wedding Date'
      @log = true
    end
  end

  def updateDate
    # if(!cookies[:user_name].blank?)
    #   @message = 'Congratulations ' + cookies[:user_name] + ' and ' + cookies[:user_fname] + '!'
      # # if params[:date] ==
      # cookies[:user_date] = params[:date]
      # @log = true
      # respond_to do |format|
      #   format.html { redirect_to '/home'}
      # end
    # end
    @message = 'Edit Wedding Date'
    @log = true
    @user = User.find(cookies[:user_id])
      @user.update_attribute(:wedDate, params[:date])
      if @user.save
        respond_to do |format|
          format.html { redirect_to '/home'}
          cookies[:user_date] = @user.wedDate
        end
      else
        render 'edit'
      end

  end

end
