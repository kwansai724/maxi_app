class CreateGoingOuts < ActiveRecord::Migration[7.0]
  def change
    create_table :going_outs do |t|
      t.date :going_out_day, null: false, comment: "お出かけ日"
      t.string :place, null: false, comment: "場所"
      t.boolean :is_stay, null: false, default: false, comment: "宿泊フラグ"
      t.text :remarks, comment: "備考"

      t.timestamps
    end
  end
end
