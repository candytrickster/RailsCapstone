class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :user_id
      t.string :name
      t.string :type
      t.string :size, array: true
      t.string :position, array: true
      t.integer :num_of_seats

      t.timestamps
    end
  end
end
