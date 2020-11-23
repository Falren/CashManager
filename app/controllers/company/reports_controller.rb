# frozen_string_literal: true

class Company::ReportsController < ApplicationController
  before_action :find_company, only: :index
  before_action :year, only: :index
  before_action :report_data, only: :index

  def index
    @report_data = @company.transactions.report_by_year(year)
  end

  private

  def report_data; end

  def year
    @year = params[:year]
  end

  def find_company
    @company = Company.find(params[:company_id])
  end
end
