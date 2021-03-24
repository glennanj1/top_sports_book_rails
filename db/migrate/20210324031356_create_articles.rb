class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.boolean :status
      t.string :name
      t.text :description
      t.string :url
      t.string :author
      t.string :title 
      t.string :url_to_image

      t.timestamps
    end
  end
end
