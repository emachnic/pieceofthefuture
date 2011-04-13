class ChangeDonationAttributes < ActiveRecord::Migration
  def self.up
    change_table :donations do |t|
      t.remove :success
      t.remove :authorization
      t.remove :message
      t.remove :params
      t.string :card_type
      t.date   :card_expires_on
      t.string :ip_address
    end
  end

  def self.down
    change_table :donations do |t|
      t.boolean :success
      t.string  :authorization
      t.string  :message
      t.text    :params
      t.remove  :card_type
      t.remove  :card_expires_on
      t.remove  :ip_address
    end
  end
end
