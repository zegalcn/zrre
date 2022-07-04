class PayCategory < ApplicationRecord
  belongs_to :parent, class_name: 'PayCategory'
  has_many :children, class_name: 'PayCategory', foreign_key: :parent_id
end
