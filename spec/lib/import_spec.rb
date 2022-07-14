require 'rails_helper'
require 'imports'

RSpec.describe ZrAbcImport do
  
  context 'filters' do
    before('import') do
      @import = ZrAbcImport.new("", 2022)
    end
    
    it "" do
      category = @import.parent_filter("Parent：child")
      expect(category.name).to match('child')
      expect(category.parent.name).to match('Parent')
    end
  end

  context 'check_headers' do
    before('import') do
      @import = ZrAbcImport.new("", 2022)
    end

    it "" do
      msg = @import.check_headers(%w{ 人资时间 姓名 新部门 用工分类 工资总额：岗位工资 })
      expect(msg.size).to match(0)
    end

    it "" do
      msg = @import.check_headers(%w{ 姓名 新部门 用工分类 工资总额：岗位工资 })
      expect(msg.size).to match(1)
    end
  end


  describe 'import' do

    before('import') do
      @import = ZrAbcImport.new("人资时间,姓名,新部门,用工分类,工资总额：岗位工资,\n四月,D,综合部,B,2000", 2022)
    end

    it "" do
      @import.import
      expect(Pay.count).to match(1)

      pay = Pay.first
      expect(pay.employee.name).to match('D')
      expect(pay.department.name).to match('综合部')
      expect(pay.year).to match(2022)
      expect(pay.month).to match(4)
      expect(pay.category.name).to match('岗位工资')
      expect(pay.category.parent.name).to match('工资总额')
    end
  end
end