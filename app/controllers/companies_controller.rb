class CompaniesController < ApplicationController

  before_action :set_company, only: %i[show edit update destroy]
  before_action :inialitize_company, only: %i[new create]

  def index
    @companies = current_user.companies.all if current_user 
  end
  
  def show; end

  def new; end

  def edit; end

  def create
    if @company.save
      redirect_to companies_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    if @company.destroy
      redirect_to companies_path, notice: t('.success')
    else 
      render :show
    end
  end

  private

  def set_company
    @company = current_user.companies.find(params[:id])
  end

  def company
    @company = params[:action] == 'new' ? current_user.companies.new : current_user.companies.new(company_params)
  end

  def company_params
    params.require(:company).permit(:name, :country, :currency, :money)
  end
end
