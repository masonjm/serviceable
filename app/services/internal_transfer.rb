class InternalTransfer
  class MoneyMover
    def initialize(from, to)
      @from = from
      @to = to
    end

    def transfer(amount)
      @from.balance -= amount
      @to.balance += amount
    end

    def commit!
      @from.save!
      @to.save!
    end
  end

  def call(amount:, from:, to:)
    mover = MoneyMover.new(from, to)

    Account.transaction do
      mover.transfer(amount)
      mover.commit!
    end
  end
end
