require 'csv'
# dce api rake import:going_outs
namespace :import do
  desc "Import Going Outs from csv"

  task going_outs: :environment do
    path = File.join Rails.root, "db/csv/going_outs.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        going_out_day: row["going_out_day"],
        place: row["place"],
        is_stay: row["is_stay"],
        remarks: row["remarks"]
      }
    end
    puts "start to create going_outs data"
    begin
      GoingOut.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError
      puts "raised error : unKnown attribute"
    end
  end
end
