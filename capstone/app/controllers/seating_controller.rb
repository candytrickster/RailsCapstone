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

      @answer = false
    end
  end


  def seatAssignValid
    respond_to do |format|
      @guest_lists = GuestList.where('user_id' => cookies[:user_id])

      @table = Table.where(params[:tableId])
      @guest = GuestList.where(params[:id])
      tableSeats = @table.num_of_seats
      takenSeats = 0
      seatsLeft = 0
      seatsNeeded = GuestList.where(:group_id => @guest.id).count

      @guest_lists.each do |guest|
        if guest.group_id == @guest.group_id
          seatsNeeded += 1
        end
      end

      @guest_lists.each do |guest|
        if Integer(guest.assigned) == Integer(@t.id)
            takenSeats += 1
        end
      end

      seatsLeft = (tableSeats - takenSeats)

      if(seatsNeeded > seatsLeft)
        @answer = false
      else
        @answer = true
      end

      format.html { redirect_to '/seating' }
      format.json { render '/seating' }
    end
  end




end
