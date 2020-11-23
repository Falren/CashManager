# frozen_string_literal: true

module Companies
  class TransactionsController < ApplicationController
    before_action :find_company
    before_action :articles, only: %i[new create]

    def index
      @transactions = @company.transactions.order(created_at: :desc)
    end

    def new
      @transaction = @company.transactions.new
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

    def articles
      @articles = Article.order(created_at: :desc)
    end

    def find_company
      @company = Company.find(params[:company_id])
    end

    def transaction_params
      params.require(:transaction).permit(:amount, :status, :transaction_time, :article_id, :company_id)
    end
  end
end
