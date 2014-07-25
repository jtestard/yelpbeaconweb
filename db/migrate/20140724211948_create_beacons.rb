class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.integer :major
      t.integer :minor
      t.string :uuid
      t.belongs_to :business
      t.timestamps
    end
  end
end
