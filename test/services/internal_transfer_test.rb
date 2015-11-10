require 'test_helper'

class InternalTransferTest < ActiveSupport::TestCase
  test "transfer money" do
    from = Account.create(balance: 100)
    to = Account.create(balance: 0)
    transfer = InternalTransfer.new

    transfer.call(amount: 50, from: from, to: to)

    assert_equal(from.reload.balance, 50)
    assert_equal(to.reload.balance, 50)
  end
end
