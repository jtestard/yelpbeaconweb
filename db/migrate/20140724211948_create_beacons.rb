class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.integer :major
      t.integer :minor
      t.string :uuid
      t.belongs_to :business
      t.string :biz_id
      t.string :biz_image
      t.string :biz_name
      t.timestamps
    end
  end
end
