class GoingOutsController < ApplicationController
  def index
    @going_outs = GoingOut.all.order(:going_out_day)
    @search_form = GoingOuts::SearchForm.new
  end

  def search
    search_form = GoingOuts::SearchForm.new(search_params)
    @period = search_form.attributes
    @going_outs = search_form.search
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def search_params
    params.require(:going_outs_search_form).permit(:start_day, :finish_day, :is_stay)
  end
end
