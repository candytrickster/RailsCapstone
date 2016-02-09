class RemoveTypeFromTable < ActiveRecord::Migration
  def change
    remove_column :tables, :type, :string
  end
end
