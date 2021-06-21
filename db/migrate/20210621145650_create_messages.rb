class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :initial_message
      t.boolean :active
      t.string :image
      t.integer :profile_id

      t.timestamps
    end
  end
end
