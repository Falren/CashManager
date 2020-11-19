class Company::ReportsController < ApplicationController
  before_action :find_company, only: :index

  def index
    @report_data = @company.transactions.report_by_year(2020)
  end

  private

  def find_company
    @company = Company.find(params[:company_id])
  end
end
