class GuestListsController < ApplicationController
  before_action :set_guest_list, only: [:show, :edit, :update, :destroy]

  STATUSES = ["Haven't Asked Yet",'Coming to Ceremony and Reception', 'Coming to Ceremony Only', 'Coming to Reception Only', 'Might Come to Ceremony and Reception', 'Might Come to Ceremony Only', 'Might Come to Reception Only', 'Not Coming']
  # GET /guest_lists
  # GET /guest_lists.json
  def index
    @guest_lists = GuestList.where('user_id' => cookies[:user_id])
    @message = 'Guest List'
    @log = true
  end

  # GET /guest_lists/1
  # GET /guest_lists/1.json
  def show
  end

  # GET /guest_lists/new
  def new
    @user = User.find_by(id: cookies[:user_id])
    @guest_list = @user.guest_lists.new
  end

  # GET /guest_lists/1/edit
  def edit
  end

  # POST /guest_lists
  # POST /guest_lists.json
  def create
    @user = User.find_by(id: cookies[:user_id])
    @guest_list = @user.guest_lists.new guest_list_params

    respond_to do |format|
      if @guest_list.save
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
      if @guest_list.update(guest_list_params)
        format.html { redirect_to @guest_list, notice: 'Guest list was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest_list }
      else
        format.html { render :edit }
        format.json { render json: @guest_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guest_lists/1
  # DELETE /guest_lists/1.json
  def destroy
    @guest_list.destroy
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