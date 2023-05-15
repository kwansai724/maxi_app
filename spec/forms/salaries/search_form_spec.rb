require 'rails_helper'

RSpec.describe Salaries::SearchForm, type: :model do
  describe 'search' do
    before do
      create(:salary, source_of_income: 'テックビズ', year: '2023年', monthly: '1月度')
      create(:salary, source_of_income: 'テックビズ', year: '2023年', monthly: '2月度')
      create(:salary, source_of_income: 'DMM', year: '2023年', monthly: '1月度')
      create(:salary, source_of_income: 'DMM', year: '2023年', monthly: '2月度')

      @search_form = Salaries::SearchForm.new(search_params)
    end

    let(:search_params) do
      {
        "source_of_income" => "テックビズ",
        "year" => "2023年",
        "monthly" => "1月度"
      }
    end

    example '検索結果が正しく取得できること' do
      salaries = @search_form.search
      expect(salaries.size).to eq 1
    end
  end
end
