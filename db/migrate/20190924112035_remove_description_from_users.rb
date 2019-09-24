class RemoveDescriptionFromUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :description
    end
  end
end
