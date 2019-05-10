class Transactions
  attr_accessor :date, :description, :amount

  def initialize(date, description, amount)
    @date        = date
    @description = description
    @amount      = amount
  end 
end
