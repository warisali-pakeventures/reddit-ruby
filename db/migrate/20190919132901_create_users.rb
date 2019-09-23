class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :profile_pic_url
      t.text :description

      t.timestamps
    end
  end
end
