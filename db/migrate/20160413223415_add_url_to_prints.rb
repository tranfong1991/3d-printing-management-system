class AddUrlToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :url, :string
  end
end
