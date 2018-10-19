class Account
  attr_reader :cleard_balance
  protected :cleard_balance
  def greater_balance_than(other)
    return @cleard_balance - other.cleard_balance
  end

end