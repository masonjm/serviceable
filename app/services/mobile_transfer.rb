class MobileTransfer
  attr_reader :transfer

  def initialize(transfer: Transfer.new)
    @transfer = transfer
  end

  def call(amount:, from_mobile:, to_mobile:)
    from = Account.find_by_mobile(from_mobile)
    to = Account.find_by_mobile(to_mobile)
    transfer.call(amount, from, to)
  end
end
