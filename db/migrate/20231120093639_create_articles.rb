class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false, comment: '記事タイトル'
      t.date :date, null: false, comment: '記事の日付'
      t.text :contentHtml, null: false, comment: '記事の内容'
      t.string :author, null: false, comment: '記事の著者'
      t.boolean :slide, null: false, default: false, comment: 'スライドの有無'

      t.timestamps
    end
  end
end
