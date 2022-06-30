class CreatePayElements < ActiveRecord::Migration[7.0]
  def change
    create_table :pay_elements do |t|
      t.string :name, null: false
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
