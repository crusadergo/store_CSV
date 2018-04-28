class StoreCsv < ApplicationRecord
  def self.parse file
    CSV.foreach file.path, headers: true do |csv|
      store_csv = StoreCsv.new name: csv['name'], number: csv['number'], date: csv['date'], description: csv['description']
      store_csv.save!
    end
  end
end
