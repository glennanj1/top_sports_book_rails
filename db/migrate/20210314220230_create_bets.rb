class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.integer :amount
      t.boolean :placed
      t.datetime :time
      t.integer :odds
      t.integer :event_id

      t.timestamps
    end
  end
end
