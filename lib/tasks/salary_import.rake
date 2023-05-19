require 'csv'
# dce api rake import:salaries
namespace :import do
  desc "Import Salaries from csv"

  task salaries: :environment do
    path = File.join Rails.root, "db/csv/salaries.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        amount_of_sales: row["amount_of_sales"],
        source_of_income: row["source_of_income"],
        year: row["year"],
        monthly: row["monthly"]
      }
    end
    puts "start to create salaries data"
    begin
      Salary.destroy_all
      Salary.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError
      puts "raised error : unKnown attribute"
    end
  end
end
