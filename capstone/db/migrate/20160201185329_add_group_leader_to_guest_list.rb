class AddGroupLeaderToGuestList < ActiveRecord::Migration
  def change
    add_column :guest_lists, :group_leader, :boolean
  end
end
