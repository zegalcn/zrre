class PayCategory < ApplicationRecord
  belongs_to :parent, class_name: 'PayCategory', optional: true
  has_many :children, class_name: 'PayCategory', foreign_key: :parent_id

  validates :name, presence: true
end