class CreateSports < ActiveRecord::Migration[6.1]
  def change
    create_table :sports do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
