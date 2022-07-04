require 'rails_helper'
require 'imports'

RSpec.describe ZrAbcImport do

  before('import') do
    @import = ZrAbcImport.new
  end
  
  context 'filters' do
    it "" do
      category = @import.parent_filter("Parent：child")
      p category
    end
  end
end