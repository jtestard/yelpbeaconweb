class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.integer :major
      t.integer :minor

      t.timestamps
    end
  end
end
