require 'rails_helper'

RSpec.describe GoingOuts::SearchForm, type: :model do
  describe 'search' do
    before do
      create(:going_out, going_out_day: '2023-02-01', is_stay: true)
      create(:going_out, going_out_day: '2023-03-01', is_stay: false)
      create(:going_out, going_out_day: '2022-11-01', is_stay: true)
      create(:going_out, going_out_day: '2022-12-01', is_stay: false)

      @search_form = GoingOuts::SearchForm.new(search_params)
    end

    let(:search_params) do
      {
        "start_day" => "2023-01-01",
        "finish_day" => "2023-05-31",
        "is_stay" => "true"
      }
    end

    example '検索結果が正しく取得できること' do
      going_outs = @search_form.search
      expect(going_outs.size).to eq 1
    end
  end
end
