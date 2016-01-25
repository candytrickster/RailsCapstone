class CreateGuestLists < ActiveRecord::Migration
  def change
    create_table :guest_lists do |t|
      t.integer :user_id
      t.string :name
      t.string :relationship
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
