class CreateNacebelCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :nacebel_codes do |t|
      t.bigint :code
      t.text :label
      t.integer :level

      t.timestamps
    end
  end
end
