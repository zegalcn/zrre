class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.belongs_to :department, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :mode, default: 0
      t.text :description

      t.timestamps
    end

    add_index :employees, :name
  end
end
