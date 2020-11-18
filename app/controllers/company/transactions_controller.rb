class Company::TransactionsController < ApplicationController
  before_action :set_company

  def index 
    @transactions = @company.transactions
  end

  def new 
    @transaction = @company.transactions.new
    @articles = Article.all
  end

  def create
    @transaction = @company.transactions.new(transaction_params)
    if @transaction.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :status, :transaction_time, :article_id, :company_id)
  end
end
