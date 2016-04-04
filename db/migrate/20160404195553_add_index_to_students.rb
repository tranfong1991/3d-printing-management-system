class AddIndexToStudents < ActiveRecord::Migration
  def change
    add_index :students, :uin, unique: true
  end
end
