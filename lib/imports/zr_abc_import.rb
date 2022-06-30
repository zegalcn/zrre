require 'roo'

module ZrAbcImport
  def import(file, sheet_name, year)
    xlsx = Roo::Spreadsheet.open(file)
    sheet = xlsx.sheet(sheet_name)

    rows = sheet.parse(header: true, clean: true)
    rows.each do |row|
      
    end 
  end
end