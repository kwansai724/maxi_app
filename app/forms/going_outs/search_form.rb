module GoingOuts
  class SearchForm < ApplicationForm
    attribute :start_day, :date, default: nil
    attribute :finish_day, :date, default: nil
    attribute :is_stay, :boolean, default: nil

    def search
      going_outs = GoingOut.where(going_out_day: start_day..finish_day)
      going_outs = going_outs.where(is_stay: is_stay) unless is_stay == nil

      going_outs
    end
  end
end
