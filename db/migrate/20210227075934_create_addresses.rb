class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :nationality
      t.string :province
      t.string :city
      t.string :remaining_address
      t.string :country
      t.string :post_cd
      t.string :mail_id
      t.string :phone_no
      t.string :linkedIn_url
      t.string :twitter_url
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
