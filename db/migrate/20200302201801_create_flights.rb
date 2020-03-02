class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.datetime :departs_at
      t.string :airline
      t.string :description
      t.integer :user_id
      t.boolean :message_sent, { :default => false }
      t.string :locator

      t.timestamps
    end
  end
end
