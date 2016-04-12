class ChangeStatusDefault < ActiveRecord::Migration
  def up
    change_column :prints, :status, :integer, :default => 0
  end

  def down
    change_column :prints, :status, :integer, :default => nil
  end
end
