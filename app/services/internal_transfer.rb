class InternalTransfer
  def call(amount:, from:, to:)
    Account.transaction do
      move_money(amount, from, to)
      persist(from, to)
    end
  end

  private

  def move_money(amount, from, to)
    from.balance -= amount
    to.balance += amount
  end

  def persist(*accounts)
    accounts.each(&:save!)
  end
end
