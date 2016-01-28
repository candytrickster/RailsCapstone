class AddSentEmailToGuestList < ActiveRecord::Migration
  def change
    add_column :guest_lists, :sent, :boolean
  end
end
