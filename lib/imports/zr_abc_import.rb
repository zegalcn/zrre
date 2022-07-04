# require 'roo'
require 'csv'

class ZrAbcImport

  COLUMNS = {
    month: '人资时间',
    name: '姓名',
    department: '新部门',
    mode: '用工分类',
    ignores: ['ABCD', '原部门', '发放方向', '是否融合人员', '发票金额']
  }

  filters = []


  #foreach(path, headers: true, row_sep: "\r\n")
  def import(doc, year)

    messages = check_headers(doc.headers)

    ignores = COLUMNS[:ignores] << [:month, :name, :department, :mode]

    csv = doc.each do |row|
      empolyee = Employee.where(COLUMNS[:name]).first_or_initialize
      department = Department.where(name: row[COLUMNS[:department]]).first_or_initialize
      empolyee.department = department

      # TODO mode convert
      # mode = row[COLUMNS[:mode]] 
      
      row.each do |key, value|
        next if ignores.include?(key)
        
      end
    end
  end

  def parent_filter(key)
    match = /([[:word:]]+)：([[:word:]]+)/.match(key)
    return nil unless match

    parent_name = match[1]
    category_name = match[2]
    category = PayCategory.where(name: category_name).first_or_initialize
    if(category.parent == nil)
      parent = PayCategory.where(name: parent_name).first_or_initialize
      category.parent = parent
    end
    category.save

    return category
  end

  def check_headers(headers)
    messages = []
    if not headers.include?(COLUMNS[:name])
      messages << "Empolyee name can't be EMPTY."
    end
    if not headers.include?(COLUMNS[:department])
      messages << "Department name can't be EMPTY."
    end
    if not headers.include?(COLUMNS[:month])
      messages << "Month can't be EMPTY."
    end
    if not headers.include?(COLUMNS[:mode])
      messages << "Month can't be EMPTY."
    end

    return messages
  end
end