# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :company, only: %i[new create]

  def index
    @companies = current_user.companies.order(created_at: :desc) if current_user
  end

  def show; end

  def new; end

  def edit; end

  def create
    @company.assign_attributes(company_params)
    if @company.save
      redirect_to companies_path
    else
      render :new
    end
  end

  def update
    if company.update(company_params)
      redirect_to company
    else
      render :edit
    end
  end

  def destroy
    if @company.destroy
      redirect_to companies_path
    else
      redirect_to root_path
    end
  end

  private

  def set_company
    @company = current_user.companies.find(params[:id])
  end

  def company
    @company ||= current_user.companies.new
  end

  def company_params
    params.require(:company).permit(:name, :country, :currency, :money)
  end
end
