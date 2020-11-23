module Company::ReportHelper

  def monthly_cash
    @monthly_cash ||= begin
      init_cash = initial_cash(@year)
      (1..12).map { |m| init_cash += ((cash_in[m] || 0) - (cash_out[m] || 0)) }
    end
  end

  def initial_cash(year)
    @initial_cash ||= begin
      return @company.money if @company.created_at.year == year

      previous_year = Time.new(year.to_i - 1)
      sum_in = @company
               .transactions
               .where(transaction_time: @company.created_at.beginning_of_year...previous_year.end_of_year)
               .in.sum(&:amount)
      sum_out = @company
                .transactions
                .where(transaction_time: @company.created_at.beginning_of_year...previous_year.end_of_year)
                .out.sum(&:amount)
      company_cash + (sum_in - sum_out)
    end
  end

  def cash_in
    @cash_in ||= @report_data.in.group_by(&:month)&.inject({}) { |h, (k, v)| h[k] = v.sum(&:total); h }
  end

  def cash_out
    @cash_out ||= @report_data.out&.group_by(&:month)&.inject({}) { |h, (k, v)| h[k] = v.sum(&:total); h }
  end

  def company_cash
    @company_cash ||= @company.money
  end

  def cash_by_type(type)
    @report_data.send(type).group_by(&:name).inject({}) { |h, (gr, tra)| h[gr] = tra.group_by(&:month); h }
  end

  def reports_by_year
    @reports_by_year ||= begin 
      year = @company.created_at.year
      (year..year + 2)
    end
  end
end