class SeatingController < ApplicationController
  def index
    if(!cookies[:user_name].blank?)
      @message = 'Seating Chart'
      @log = true

      @all = GuestList.where('user_id' => cookies[:user_id])
      @guest_lists = GuestList.where('user_id = ? AND group_leader = ?', cookies[:user_id], true)
      @numInGroup = 0
      @tables = Table.where('user_id' => cookies[:user_id])
      @user = User.find_by(id: cookies[:user_id])
      @table = @user.tables.new



    end
  end
end
