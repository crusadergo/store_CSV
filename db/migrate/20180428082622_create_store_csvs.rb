class CreateStoreCsvs < ActiveRecord::Migration[5.1]
  def change
    create_table :store_csvs do |t|
      t.string :name
      t.integer :number
      t.string :description
      t.datetime :date

      t.timestamps
    end
  end
end
