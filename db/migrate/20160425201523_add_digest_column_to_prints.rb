class AddDigestColumnToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :digest, :string
  end
end
