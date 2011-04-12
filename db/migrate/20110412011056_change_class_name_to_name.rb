class ChangeClassNameToName < ActiveRecord::Migration
  def self.up
    rename_column :classrooms, :class_name, :name
    add_index :classrooms, :name, :unique => true
  end

  def self.down
    rename_column :classrooms, :name, :class_name
  end
end
