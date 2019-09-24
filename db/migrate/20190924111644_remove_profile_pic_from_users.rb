class RemoveProfilePicFromUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :profile_pic_url
    end
  end
end
