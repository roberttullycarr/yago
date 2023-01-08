class CreateEntityProfileCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_profile_codes do |t|
      t.references :entity_profile, null: false, foreign_key: true
      t.references :nacebel_code, null: false, foreign_key: true

      t.timestamps
    end
  end
end
