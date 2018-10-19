class Accounts
  def initialize(checking, savings)
    @checking = checking
    @saving = savings
  end

  private
    def debit(account, amount)
      account.balance -= amount
    end
    def credit(account, amount)
      account.balance += amount
    end

  public
    def transfer_to_savings(amount)
      debit(@checking, amount)
      credit(@saving, amount)
    end
end