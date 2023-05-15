class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.integer :amount_of_sales, null: false, default: 0, comment: "売上高"
      t.string :source_of_income, null: false, comment: "収入源"
      t.string :year, null: false, comment: "年度"
      t.string :monthly, null: false, comment: "月次"

      t.timestamps
    end
  end
end
