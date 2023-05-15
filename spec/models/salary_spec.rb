require 'rails_helper'

RSpec.describe Salary, type: :model do
  before do
    create(:salary, amount_of_sales: 500_000, source_of_income: 'テックビズ', year: '2023年', monthly: '4月度')
    create(:salary, amount_of_sales: 100_000, source_of_income: 'DMM', year: '2023年', monthly: '4月度')
    create(:salary, amount_of_sales: 550_000, source_of_income: 'テックビズ', year: '2023年', monthly: '5月度')
    create(:salary, amount_of_sales: 120_000, source_of_income: 'DMM', year: '2023年', monthly: '5月度')
  end

  describe 'column_chart' do
    example 'グラフ用の形式で値が返されること' do
      salaries = Salary.column_chart
      expect(salaries.size).to eq 2
      expect(salaries[0][:name]).to eq 'テックビズ'
      expect(salaries[0][:data].size).to eq 2
      expect(salaries[0][:data][0]).to eq ['2023年4月度', 500_000]
    end
  end

  describe 'chart_data' do
    let(:chart_data) do
      Salary.chart_data(source_of_income)
    end

    let(:source_of_income) do
      'テックビズ'
    end

    example '正しい値が返されること' do
      salaries = chart_data
      expect(salaries.size).to eq 2
      expect(salaries[0]).to eq ['2023年4月度', 500_000]
    end
  end
end
