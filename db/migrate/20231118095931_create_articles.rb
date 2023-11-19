class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.datetime :date
      t.string :tags
      t.string :author
      t.string :slide
      t.text :contentHtml

      t.timestamps
    end
  end
end
