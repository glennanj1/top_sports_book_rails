class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :business_status
      t.string :icon
      t.string :name
      t.boolean :opening_hours
      t.string :photos
      t.integer :rating
      t.string :reference
      t.integer :user_rating_total
      t.string :vicinity
      t.string :zip

      t.timestamps
    end
  end
end
