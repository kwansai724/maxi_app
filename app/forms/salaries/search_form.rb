module Salaries
  class SearchForm < ApplicationForm
    attribute :source_of_income, :string, default: nil
    attribute :year, :string, default: nil
    attribute :monthly, :string, default: nil

    def search
      salaries = source_of_income.blank? ? Salary.all : Salary.where(source_of_income: source_of_income)
      salaries = salaries.where(year: year) unless year.blank?
      salaries = salaries.where(monthly: monthly) unless monthly.blank?

      salaries.column_chart
    end
  end
end
