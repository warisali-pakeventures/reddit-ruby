class RemoveUserAuthCols < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :username, :password, :email
    end
  end
end
