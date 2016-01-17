class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :fianceeName
      t.string :email
      t.string :wedDate
      t.string :password_digest

      t.timestamps
    end
  end
end
