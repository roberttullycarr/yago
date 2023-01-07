class CreateEntityProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_profiles do |t|
      t.string :name
      t.integer :cover_value
      t.integer :deductible_value
      t.integer :legal_value
      t.text :cover_description
      t.text :deductible_description
      t.text :legal_description

      t.timestamps
    end
  end
end
