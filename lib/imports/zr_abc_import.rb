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

  def initialize(doc, year)
    @doc = CSV.parse(doc, headers: true)
    @year = year
  end

  def import

    # messages = check_headers(@doc.headers)

    ignores = COLUMNS[:ignores] << [:month, :name, :department, :mode]

    @doc.each do |row|
      employee = Employee.where(name: row[COLUMNS[:name]]).first_or_initialize
      department = Department.where(name: row[COLUMNS[:department]]).first_or_initialize
      employee.department = department

      mode = convert_mode(row[COLUMNS[:mode]])
      
      row.each do |key, value|
        next if ignores.include?(key)
        next if value.nil?

        category = parent_filter(key)
        next if category.nil?

        pay = Pay.create!(department: department, employee: employee, category_id: category.id, mode: mode,
          year: @year, month: convert_month(row[COLUMNS[:month]]), sum: value)
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

  MONTH = {"一月" => 1, "二月" => 2, "三月" => 3, "四月" => 4, "五月" => 5, "六月" => 6, "七月" => 7, "八月" => 8, "九月" => 9, "十月" => 10, "十一月" => 11, "十二月" => 12}

  def convert_month(m)
    MONTH[m]
  end

  MODE = { "合同制" => 11, "恒品劳务" => 13 }
  def convert_mode(m)
    MODE[m]
  end
end