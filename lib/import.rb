class Import

  def self.all_models

    file = "#{Rails.root}/public/models1.xlsx"

    workbook = RubyXL::Parser.parse(file)
    workbook.each do |sheet|
      if sheet.extract_data.present?
        worksheet = sheet
        worksheet.get_table[:table].each do |row|
          existing_record = (sheet.sheet_name.constantize).find_by_id(row["id"])

          if existing_record.present?
            record = JSON.parse(existing_record.to_json)
            record.delete("created_at")
            record.delete("updated_at")
            (record.has_key? "status" ) ? (record["status"]=record["status"].to_s) : nil
          else
            record={}
          end
          if record == row
            nil
          else
            existing_record.destroy if existing_record.present?
            (sheet.sheet_name.constantize).create! row
          end
        end
      end
    end
  end
end