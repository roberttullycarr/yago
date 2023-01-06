class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_one
      t.string :address_two
      t.string :address_city
      t.string :address_country
      t.string :post_code
      t.string :email
      t.string :login_token
      t.datetime :login_token_verified_at

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
