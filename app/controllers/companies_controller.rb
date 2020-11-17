class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end
  
  def show; end

  def new
    @company = current_user.companies.new
  end

  def edit; end

  def create
    @company = current_user.companies.new(company_params)
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

  def company_params
    params.require(:company).permit(:name, :country, :currency, :money)
  end
end
