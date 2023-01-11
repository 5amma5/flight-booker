class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :departure, null: false, foreign_key: { to_table: :airports }
      t.references :arrival, null: false, foreign_key: { to_table: :airports }
      t.datetime :start
      t.integer :duration

      t.timestamps
    end
  end
end
