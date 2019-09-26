class RemoveVotableFromPost < ActiveRecord::Migration[6.0]
  def change
    change_table :posts do |t|
      t.remove :votable
    end
  end
end
