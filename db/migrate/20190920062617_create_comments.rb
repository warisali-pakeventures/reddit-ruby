class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :description

      t.belongs_to :post
      t.belongs_to :user

      t.references :reply_to

      t.references :votable, polymorphic: true

      t.timestamps
    end
  end
end
