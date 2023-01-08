class CreateEntityCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :entity_codes do |t|
      t.references :legal_entity, null: false, foreign_key: true
      t.references :nacebel_code, null: false, foreign_key: true

      t.timestamps
    end
  end
end
