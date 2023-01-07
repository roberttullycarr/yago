class CreateLegalEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :legal_entities do |t|
      t.bigint :annual_revenue
      t.string :enterprise_number
      t.string :legal_name
      t.boolean :natural_person
      t.references :user, index: true

      t.timestamps
    end
  end
end
