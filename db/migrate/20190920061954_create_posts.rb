class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description

      t.belongs_to :subreddit
      t.belongs_to :user

      t.references :votable, polymorphic: true

      t.timestamps
    end
  end
end
