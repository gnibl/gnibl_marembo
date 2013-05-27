class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :full_name
      t.string :password
      t.string :current_city
      t.string :confirmed_password
      t.string :profile_img

      t.timestamps
    end
  end

  def drop
   drop_table :users
  end
end
