class RemoveVotableIdAndTypeFromPosts < ActiveRecord::Migration[6.0]
  def change
    change_table :posts do |t|
      t.remove :votable_id
      t.remove :votable_type
    end
  end
end
