class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :yelp_username
      t.string :password_hash
      t.string :biz_id
      t.string :password_salt

      t.timestamps
    end
  end
end
