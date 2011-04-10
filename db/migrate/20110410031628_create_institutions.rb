class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.string :name
      t.string :school_site
      t.string :contact_name
      t.string :contact_email
      t.string :contact_title
      t.string :street_one
      t.string :street_two
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone
      t.text :wish_list

      t.timestamps
    end
    
    add_index :institutions, :name, :unique => true
  end

  def self.down
    drop_table :institutions
  end
end
