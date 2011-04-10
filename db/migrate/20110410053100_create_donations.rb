class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params
      t.string :first_name
      t.string :last_name
      t.string :ad_website
      t.string :email
      t.integer :box_quantity
      t.string :custom_institution_name
      t.string :custom_classroom_name
      t.string :custom_classroom_teacher
      t.string :custom_classroom_school
      t.integer :institution_id
      t.integer :classroom_id

      t.timestamps
    end
    
    add_index :donations, :first_name
    add_index :donations, :last_name
    add_index :donations, :email
  end

  def self.down
    drop_table :donations
  end
end
