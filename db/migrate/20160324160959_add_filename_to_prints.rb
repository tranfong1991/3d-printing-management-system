class AddFilenameToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :filename, :string
  end
end
