class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :title,               null: false
      t.integer :price,              null: false
      t.integer :category_id,              null: false
      t.integer :usage_status_id,          null: false
      t.integer :postage_id,               null: false
      t.integer :shipment_source_id,       null: false
      t.integer :date_of_shipment_id,      null: false
      t.text :concept,               null: false
      t.references :user,            null: false
      t.timestamps
    end
  end
end
