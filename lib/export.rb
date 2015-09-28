class Export

  def self.get_val(worksheet, model)

    all_values=[]
    attributes = model.column_names
    attributes.delete("created_at")
    attributes.delete("updated_at")
    all_values.push attributes
    model.all.each do |datas|
      all_values.push datas.attributes.slice(*attributes).values
    end
    col_index = 0
    all_values.each do |row|
      row_index = 0
      row.each do |cell|
        worksheet.add_cell(col_index,row_index,cell)
        row_index+=1
      end
      col_index+=1
    end
  end

  def self.all_models

    workbook = RubyXL::Workbook.new
    worksheet=workbook[0]
    worksheet.sheet_name = 'Menu'

    ary=["Menu", "Article","User"]

    ary.each do |w|

      if w != "Menu"
        worksheet = workbook.add_worksheet(w)
      end

      val=w.constantize
      get_val(worksheet, val)
    end

    workbook.write("#{Rails.root}/public/models.xlsx")

  end
end
