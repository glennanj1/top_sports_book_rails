class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :review_id
      t.integer :rating
      t.string :user_id
      t.string :profile_url
      t.string :image_url
      t.string :name
      t.string :text
      t.datetime :time_created
      t.string :url

      t.timestamps
    end
  end
end
