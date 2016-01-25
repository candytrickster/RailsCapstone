class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name);
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/home'}
        format.json { render :show, status: :created, location: @user }
        cookies[:user_id] = @user.id
        cookies[:user_name] = @user.name
        cookies[:user_fname] = @user.fianceeName
        cookies[:user_date] = @user.wedDate
        cookies[:user_email] = @user.email
        # cookies[:user] = {:id => ''+@user.id, :name => @user.name, :fname => @user.fianceeName, :wedDate => @user.wedDate, :email => @user.email}
        cookies[:logged_in] = true;
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  #GET /login
  def log
    # get the log in page
  end

  #POST /login
  def login

    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      cookies[:user_id] = user.id
      cookies[:user_name] = user.name
      cookies[:user_fname] = user.fianceeName
      cookies[:user_date] = user.wedDate
      cookies[:user_email] = user.email
      # cookies[:user] = {:id => user.id, :name => user.name, :fname => user.fianceeName, :wedDate => user.wedDate, :email => user.email}
      cookies[:logged_in] = true;
      # redirect_to :action => 'home'
      @message =  'Hello World ' + user.name + ' ' + user.fianceeName
      respond_to do |format|
        format.html { redirect_to '/home'}
      end
    else
      # flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'log'
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :fianceeName, :email, :wedDate, :password, :password_confirmation)
    end
end
