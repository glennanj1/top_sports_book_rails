class CreateBetslips < ActiveRecord::Migration[6.1]
  def change
    create_table :betslips do |t|
      t.boolean :placed
      t.integer :amount
      t.string :status
      t.integer :bet_id

      t.timestamps
    end
  end
end
