class CreateOdds < ActiveRecord::Migration[6.1]
  def change
    create_table :odds do |t|
      t.integer :sport_id
      t.string :sport_key 
      t.string :sport_nice 
      t.string :teams 
      t.string :home_team
      t.datetime :commence_time 
      t.string :site_key 
      t.integer :odds


      t.timestamps
    end
  end
end
