class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password
      t.integer :category

      t.timestamps null: false
    end
  end
end
