class AddSeatsOccupiedToTable < ActiveRecord::Migration
  def change
    add_column :tables, :seats_occupied, :integer
  end
end
