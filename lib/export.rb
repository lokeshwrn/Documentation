class Export

  def self.get_val(worksheet, model, col_names)
    @data = model.order(:id)
    all_values=[]
    all_values.push model.column_names.slice(*col_names).values
    model.all.each do |datas|
      all_values.push datas.attributes.values
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

    col_name = %w(created_at updated_at)

    workbook = RubyXL::Workbook.new
    worksheet=workbook[0]
    worksheet.sheet_name = 'Menu'

    get_val(worksheet, Menu, col_name)

    worksheet = workbook.add_worksheet('Articles')
    8,9
    col_name = %w(id title description content user_id status reference_url github_url comments_count rating)
    get_val(worksheet, Article,col_name)

    worksheet = workbook.add_worksheet('User')
    col_name = %w(id user_name email password_hash password_salt role status)
    get_val(worksheet, User,col_name)

    workbook.write("#{Rails.root}/public/export.xlsx")

  end
end



#values = foo.attributes.slice(*attributes).values