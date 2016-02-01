class RemoveRelatioshipFromGuestList < ActiveRecord::Migration
  def change
    remove_column :guest_lists, :relationship, :string
  end
end
