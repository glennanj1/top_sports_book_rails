class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.string :name
      t.string :image
      t.string :chat
      t.integer :message_id

      t.timestamps
    end
  end
end
