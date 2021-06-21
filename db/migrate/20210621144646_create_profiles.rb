class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.boolean :match
      t.string :image

      t.timestamps
    end
  end
end
