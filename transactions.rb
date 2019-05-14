class Transactions
  attr_accessor :date, :description, :amount, :currencyt

  def initialize(date, description, amount, currencyt)
    @date        = date
    @description = description
    @amount      = amount
    @currencyt    = currencyt
  end 
end
