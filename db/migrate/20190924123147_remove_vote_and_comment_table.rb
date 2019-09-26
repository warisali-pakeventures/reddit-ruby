class RemoveVoteAndCommentTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :comments
    drop_table :votes

    change_table :posts do |t|
      t.remove :votable
    end
  end
end
