class Company::ReportsController < ApplicationController
  before_action :find_company, only: :index
  before_action :set_year, only: :index

  def index
    @report_data = @company.transactions.report_by_year(@year)
  end

  private

  def set_year
    @year = params[:year]
  end

  def find_company
    @company = Company.find(params[:company_id])
  end
end
