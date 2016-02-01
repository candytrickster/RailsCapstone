class AddGroupIdToGuestList < ActiveRecord::Migration
  def change
    add_column :guest_lists, :group_id, :integer
  end
end
