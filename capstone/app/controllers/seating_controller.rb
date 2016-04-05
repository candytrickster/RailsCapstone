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

  def seat

  end

  def seatAssignValid
    @answer = true
    if GuestList.where('user_id' => cookies[:user_id])
      @guest = GuestList.find(params[:guestId])
      @table = Table.find(params[:tableId])
      puts @guest.id
      tableSeats = @table.num_of_seats
      takenSeats = 0
      seatsLeft = 0
      seatsNeeded = GuestList.where(:group_id => @guest.id).count
      @guest_lists = GuestList.where('user_id = ? AND group_leader = ?', cookies[:user_id], true)

      puts seatsNeeded
      @guest_lists.each do |guest|
        if guest.group_id == @guest.group_id
          seatsNeeded += 1
        end
      end

      @guest_lists.each do |guest|
        if Integer(guest.assigned) == Integer(@table.id)
            takenSeats += 1
        end
      end

      seatsLeft = (tableSeats - takenSeats)

      if(seatsNeeded > (seatsLeft+1))
        @answer = false
        @table.update_attribute(:occupied, '('+takenSeats+' out of '+seatsLeft +')')
        puts 'yo yo yo'
        puts @table.occupied
      else
        @answer = true
      end

      head :no_content   # returns 204 NO CONTENT and triggers success callback
    else
      head :not_found    # returns 404 NOT FOUND and triggers error callback
    end
  end




end
