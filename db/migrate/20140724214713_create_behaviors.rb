class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.belongs_to :beacon
      t.string  :proximity
      t.string  :status
      t.string  :action
      t.timestamps
    end
  end
end
