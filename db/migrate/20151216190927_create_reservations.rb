class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :item, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :rent_term
      t.string :rent_fee
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps null: false
    end
  end
end
