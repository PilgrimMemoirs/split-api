class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.money :owes
      t.boolean :paid, default: false
      t.integer :nights, array: true, default: []
      t.references :trip, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
