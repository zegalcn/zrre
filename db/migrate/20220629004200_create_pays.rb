class CreatePays < ActiveRecord::Migration[7.0]
  def change
    create_table :pays do |t|
      t.belongs_to :department, null: false, foreign_key: true
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :category, null: false#, foreign_key: true
      t.integer :year, null: false
      t.integer :month, null: false
      t.float :sum, default: 0.0

      t.timestamps
    end
  end
end
