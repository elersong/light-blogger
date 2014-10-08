class AddAuthorFieldToArticle < ActiveRecord::Migration
  
  def change
    change_table :articles do |t|
      t.references :author, index: true
    end
  end
  
  def down
    change_table :articles do |t|
      t.remove :author_id
    end
  end
  
end
