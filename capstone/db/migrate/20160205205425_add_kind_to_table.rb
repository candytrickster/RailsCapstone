class AddKindToTable < ActiveRecord::Migration
  def change
    add_column :tables, :kind, :string
  end
end
