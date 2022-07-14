class Employee < ApplicationRecord
  belongs_to :department

  validates :name, presence: true

  enum mode: { OTHERS: 0, CT_B: 1, CT_C: 2, CT_D: 3, CS_B: 11, CS_C: 12, CS_D: 13, CS_E: 14 }
end
