class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.integer :odd_id
      t.integer :user_id
      t.integer :amount
      

      t.timestamps
    end
  end
end
