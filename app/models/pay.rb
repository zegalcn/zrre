class Pay < ApplicationRecord
  belongs_to :department
  belongs_to :employee
  belongs_to :category, class_name: 'PayCategory'#, foreign_key: 'category_id'

end
