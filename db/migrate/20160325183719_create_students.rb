class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :uin
      t.string :name
      t.string :email
      t.string :note

      t.timestamps null: false
    end
  end
end
