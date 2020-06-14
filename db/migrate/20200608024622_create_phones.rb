class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.string :name
      t.decimal :display, precision: 4, scale: 2
      t.integer :ram
      t.integer :memory
      t.string :processor
      t.string :front_camera
      t.string :back_camera
      t.decimal :price, precision: 7, scale: 2
      t.string :image

      t.timestamps
    end
  end
end
