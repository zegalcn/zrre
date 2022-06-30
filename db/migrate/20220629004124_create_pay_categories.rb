class CreatePayCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :pay_categories do |t|
      t.belongs_to :parent, null: false, foreign_key: true
      t.string :name
      t.integer :mode
      t.text :description

      t.timestamps
    end
  end
end
