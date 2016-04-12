class AddNoteToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :note, :string
  end
end
