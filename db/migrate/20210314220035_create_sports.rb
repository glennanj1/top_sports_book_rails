class CreateSports < ActiveRecord::Migration[6.1]
  def change
    create_table :sports do |t|
      t.string :key 
      t.boolean :active 
      t.string :group 
      t.string :details 
      t.string :title 
  

      t.timestamps
    end
  end
end
