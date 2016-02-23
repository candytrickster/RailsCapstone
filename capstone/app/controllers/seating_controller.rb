class SeatingController < ApplicationController
  def index
    if(!cookies[:user_name].blank?)
      @message = 'Seating Chart'
      @log = true

      @all = GuestList.where('user_id' => cookies[:user_id])
      @guest_lists = GuestList.where('user_id = ? AND group_leader = ?', cookies[:user_id], true)
      @guest_lists = @guest_lists.order(:name)
      @numInGroup = 0
      @tables = Table.where('user_id' => cookies[:user_id])
      @user = User.find_by(id: cookies[:user_id])
      @table = @user.tables.new

    end
  end


  def numOfSeats
    @table = Table.where(params[:tableId])
    @chairs = @table.num_of_seats

    @guest = GuestList.where(params[:id])
    @chairFillers = GuestList.where(:group_id => @guest.id).count
  end

  def getTableId
    @table = Table.where(params[:tableId])
    @tableId = @table.id
  end

end
