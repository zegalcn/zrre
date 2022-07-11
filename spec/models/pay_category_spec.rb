require 'rails_helper'

RSpec.describe PayCategory, type: :model do
  context "with 2 or more comments" do
    it "orders them in reverse chronologically" do
      pc1 = PayCategory.create!(name: 'category 1')
      pc2 = PayCategory.create!(name: 'category 2', parent: pc1)
      expect(pc1.children.include?(pc2)).to be
    end
  end
end
