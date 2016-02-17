class AddAssignedToGuestList < ActiveRecord::Migration
  def change
    add_column :guest_lists, :assigned, :string
  end
end
