class RecordsController < ApplicationController
  def index
    @records = Record.order(views: :desc)
    @record = @records.first
  end

  def new
    redirect_to slug_path Record.create
  end

  def show
    @record = Record.find_by_slug params[:slug]
    @record.increment!(:views)
  end

  def short_url
    redirect_to slug_path Record.find params[:id]
  end
end
