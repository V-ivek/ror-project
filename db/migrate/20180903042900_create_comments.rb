class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true
      t.string :commenter
      t.string :content
      t.timestamps
    end
  end
end
