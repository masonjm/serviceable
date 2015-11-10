class Transfer
  class InsufficientFunds < StandardError; end

  attr_reader :transfer

  def initialize(transfer: InternalTransfer.new)
    @transfer = transfer
  end

  def call(amount:, from:, to:)
    raise InsufficientFunds unless from.balance >= amount
    transfer.call(amount: amount, from: from, to: to)
  end
end
