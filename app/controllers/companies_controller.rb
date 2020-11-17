class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
  end
  
  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(@company[:id])
    else 
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_path(@company[:id])
    else 
      render 'edit'
    end
  end
  
  def delete
    @company = Company.find(params[:id])
    if @company.delete
      redirect_to root_path
    else
      render 'show'
    end
  end
end
