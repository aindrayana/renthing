class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :hourly_rate
      t.string :daily_rate
      t.string :weekly_rate
      t.string :monthly_rate
      t.boolean :isavailable
      t.boolean :ispublish
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
