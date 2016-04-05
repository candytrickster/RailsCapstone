class RemoveSeatsOccupiedFromTable < ActiveRecord::Migration
  def change
    remove_column :tables, :seats_occupied, :integer
  end
end
