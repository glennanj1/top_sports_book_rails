class CreateMpgEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :mpg_emails do |t|
      t.string :email

      t.timestamps
    end
  end
end
