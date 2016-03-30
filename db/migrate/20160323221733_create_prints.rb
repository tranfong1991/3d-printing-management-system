class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.string :uin
      t.integer :status

      t.timestamps null: false
    end
  end
end
