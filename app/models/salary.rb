class Salary < ApplicationRecord
  def self.column_chart
    source_of_incomes = Salary.distinct.pluck(:source_of_income)
    source_of_incomes.each_with_object([]) do |source_of_income, array|
      data = chart_data(source_of_income)
      data = data.reject { |d| d[1].nil? }
      array << { name: source_of_income.to_s, data: data }
    end
  end

  def self.chart_data(source_of_income)
    years = Salary.distinct.pluck(:year)
    monthly = Salary.distinct.pluck(:monthly)

    data = years.map do |year|
      monthly.map do |month|
        period = "#{year}#{month}"
        amount_of_sales = Salary.find_by(source_of_income: source_of_income, year: year, monthly: month)&.amount_of_sales
        data = period.to_s, amount_of_sales
      end
    end
    data.flatten(1)
  end
end
