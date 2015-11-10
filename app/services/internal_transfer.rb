class InternalTransfer
  def call(amount:, from:, to:)
    Account.transaction do
      from.balance -= amount
      to.balance += amount

      from.save!
      to.save!
    end
  end
end
