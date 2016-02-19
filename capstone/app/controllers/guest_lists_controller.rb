class GuestListsController < ApplicationController
  before_action :set_guest_list, only: [:show, :edit, :update, :destroy]

  STATUSES = ["Haven't Asked Yet",'Coming to Ceremony and Reception', 'Coming to Ceremony Only', 'Coming to Reception Only', 'Might Come to Ceremony and Reception', 'Might Come to Ceremony Only', 'Might Come to Reception Only', 'Not Coming']
  # GET /guest_lists
  # GET /guest_lists.json
  def index
    if(!cookies[:user_name].blank?)
      @guest_lists = GuestList.where('user_id' => cookies[:user_id])
      @message = 'Guest List'
      @log = true
      @unsure = @guest_lists.where(:status => "Haven't Asked Yet").count
      @yes_both = @guest_lists.where(:status => 'Coming to Ceremony and Reception').count
      @yes_c = @guest_lists.where(:status => 'Coming to Ceremony Only').count
      @yes_r = @guest_lists.where(:status => 'Coming to Reception Only').count
      @maybe_both = @guest_lists.where(:status => 'Might Come to Ceremony and Reception').count
      @maybe_c = @guest_lists.where(:status => 'Might Come to Ceremony Only').count
      @maybe_r = @guest_lists.where(:status => 'Might Come to Reception Only').count
      @no = @guest_lists.where(:status => 'Not Coming').count
    end
  end

  # GET /guest_lists/1
  # GET /guest_lists/1.json
  def show
  end

  # GET /guest_lists/new
  def new
    if(!cookies[:user_name].blank?)
      @user = User.find_by(id: cookies[:user_id])
      @guest_list = @user.guest_lists.new
      @message = 'New Guest'
      @log = true
    end
  end

  # GET /guest_lists/1/edit
  def edit
    if(!cookies[:user_name].blank?)
      @message = 'Edit Guest'
      @log = true
    end
  end

  def make_invites
    if(!cookies[:user_name].blank?)
      @message = 'Create Invitations'
      @log = true
    end
  end

  def rsvp
    @guest = GuestList.find(params[:guest_id])
    @user = User.find(@guest.user_id)
    @message = 'Hello ' + @guest.name
    @members = GuestList.where('group_id = ? AND user_id = ?', @guest.group_id, @user.id).count
    if(@members > 1)
      @intro = 'You and ' + (@members-1).to_s + ' others'
    else
      @intro = 'You'
    end
  end

  def send_mail
    if(!cookies[:user_name].blank?)
      @guest = GuestList.find(params[:guest_id])
      @guest.update_attribute(:sent, true)
      @message = 'Invitation Sent'
      @log = true
      RsvpMailer.guest_invite(@guest).deliver
      redirect_to '/invite'
    end
  end

  def update_guest_status
    @guest = GuestList.find(params[:guest_id])
    GuestList.all.each do |guest|
      if(guest.group_id == @guest.group_id)
        guest.update_attribute(:status, params[:status])
      end
    end
  end

  # POST /guest_lists
  # POST /guest_lists.json
  def create
    @user = User.find_by(id: cookies[:user_id])
    @guest_list = @user.guest_lists.new guest_list_params
    @guest_list.sent = false
    @guest_list.assigned = '0'
    respond_to do |format|
      if @guest_list.save
        @guest_list.update_attribute(:group_id, @guest_list.id)
        @guest_list.update_attribute(:group_leader, true)

        if(!params[:mem].blank?)
          params[:mem].each do |value|
            if(value[1].blank?)
              @new_guest = @user.guest_lists.new(:user_id => @user.id, :name => @guest_list.name + "'s additional member", :status => @guest_list.status, :group_id => @guest_list.id, :group_leader => false, :assigned => '0')
            else
              @new_guest = @user.guest_lists.new(:user_id => @user.id, :name => value[1], :status => @guest_list.status, :group_id => @guest_list.id, :group_leader => false, :assigned => '0')
            end
            @new_guest.save
          end
        end
        format.html { redirect_to '/invite' }
        format.json { render :show, status: :created, location: @guest_list }
      else
        format.html { render :new }
        format.json { render json: @guest_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guest_lists/1
  # PATCH/PUT /guest_lists/1.json
  def update
    respond_to do |format|
      @group = @guest_list.group_id
      @assign = '0'
      if(!params[:assigned].blank?)
        @assign = params[:assigned]
      end
      if @guest_list.update(guest_list_params)
        @guest_list.update_attribute(:assigned, @assign)
        format.html { redirect_to '/invite' }
        format.json { render :show, status: :ok, location: @guest_list }
      else
        format.html { render :edit }
        format.json { render json: @guest_list.errors, status: :unprocessable_entity }
      end
      GuestList.all.each do |guest|
        if(guest.group_id == @group)
          if guest.update_attribute(:status, @guest_list.status)
            guest.update_attribute(:assigned, @assign)
            format.html { redirect_to '/invite' }
            format.json { render :show, status: :ok, location: @guest_list }
          else
            format.html { render :edit }
            format.json { render json: @guest_list.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # DELETE /guest_lists/1
  # DELETE /guest_lists/1.json
  def destroy
    @group = @guest_list.group_id
    GuestList.all.each do |guest|
      if(guest.group_id == @group)
        guest.destroy
      end
    end
    respond_to do |format|
      format.html { redirect_to guest_lists_url, notice: 'Guest list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest_list
      @guest_list = GuestList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_list_params
      params.require(:guest_list).permit(:user_id, :name, :relationship, :email, :status)
    end
end
