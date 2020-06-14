class CreateLineitems < ActiveRecord::Migration[5.1]
  def change
    create_table :lineitems do |t|
      t.references :phone, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
