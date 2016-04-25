class AddExtensionToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :extension, :string
  end
end
