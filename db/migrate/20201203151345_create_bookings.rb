class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date_start
      t.date :date_end
      t.references :user, null: false, foreign_key: true
      # t.references :offer, null: false, foreign_key: true
      t.text :special_request

      t.timestamps
    end
  end
end
