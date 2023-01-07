class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.boolean :available
      t.bigint :coverage_ceiling
      t.bigint :deductible
      t.string :quote_id
      t.string :coverage_ceiling_formula
      t.string :deductible_formula
      t.decimal :after_delivery_premium
      t.decimal :public_liability_premium
      t.decimal :professional_indemity_premium
      t.decimal :entrusted_objects_premium
      t.decimal :legal_expenses_premium
      t.references :legal_entity, index: true

      t.timestamps
    end
  end
end
