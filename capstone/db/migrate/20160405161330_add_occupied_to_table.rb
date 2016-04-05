class AddOccupiedToTable < ActiveRecord::Migration
  def change
    add_column :tables, :occupied, :string
  end
end
