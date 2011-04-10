class CreateClassrooms < ActiveRecord::Migration
  def self.up
    create_table :classrooms do |t|
      t.string :class_name
      t.string :teacher
      t.string :phone
      t.string :email
      t.text :wish_list
      t.integer :institution_id

      t.timestamps
    end
    
    add_index :classrooms, :class_name, :unique => true
    add_index :classrooms, :teacher
  end

  def self.down
    drop_table :classrooms
  end
end
