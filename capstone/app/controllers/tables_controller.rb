class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]

  Types = ['rec','circle','head']

  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.where('user_id' => cookies[:user_id])
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
  end

  # GET /tables/new
  def new
    if(!cookies[:user_name].blank?)
      @user = User.find_by(id: cookies[:user_id])
      @table = @user.tables.new
      @message = 'New Table'
      @log = true
    end
  end

  # GET /tables/1/edit
  def edit
  end

  def success
    @message = 'Success!'
    @log = true
  end

  # POST /tables
  # POST /tables.json
  def create
      @user = User.find_by(id: cookies[:user_id])
      @table = @user.tables.new table_params
      @message = 'New Table'
      @log = true
      respond_to do |format|
        if @table.save
          @table.update_attribute(:kind, params[:kind])
          @table.update_attribute(:position, '100:100:0')
          if(params[:kind] == 'circle')
            @table.update_attribute(:size, '80')
          else
            @table.update_attribute(:size, '300:150')
          end

          format.html { redirect_to '/success' }
          format.json { render :show, status: :created, location: @table }
        else
          format.html { render :new }
          format.json { render json: @table.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      # var id = params[:id]
      # var pos = params[:position]
      # @table = Table.where('id' => id)
      # @table.update_attribute(:position, pos)
      # puts "Logging to the rails console"
      if @table.update(table_params)
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    GuestList.where(:assigned => @table.id).each do |guest|
      guest.update_attribute(:assigned, '0')
    end
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: 'Table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:user_id, :name, :kind, :size, :position, :num_of_seats)
    end
end
