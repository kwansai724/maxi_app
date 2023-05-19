class SalariesController < ApplicationController
  before_action :set_source_of_incomes
  before_action :set_years
  before_action :set_monthlies

  def index
    @salaries = Salary.column_chart
    @search_form = Salaries::SearchForm.new
  end

  def search
    search_form = Salaries::SearchForm.new(search_params)
    @salaries = search_form.search
    @search_attributes = search_form.attributes

    render :index
  end

  private

  def search_params
    params.require(:salaries_search_form).permit(:source_of_income, :year, :monthly)
  end

  def set_source_of_incomes
    @source_of_incomes = Salary.distinct.pluck(:source_of_income)
  end

  def set_years
    @years = Salary.distinct.pluck(:year)
  end

  def set_monthlies
    @monthlies = Salary.distinct.pluck(:monthly)
  end
end
