require 'test_helper'

class TransferTest < ActiveSupport::TestCase
  test "insufficient funds" do
    from = Account.create(balance: 0)
    to = Account.create(balance: 0)

    # Create a "do nothing" service stub so that the test runs faster
    transfer_stub = ->(*) { true }
    transfer = Transfer.new(transfer: transfer_stub)

    assert_raises(Transfer::InsufficientFunds) do
      transfer.call(amount: 50, from: from, to: to)
    end
  end

  test "sufficient funds" do
    from = Account.create(balance: 100)
    to = Account.create(balance: 0)

    # Create a service stub with a known return value we can test
    transfer_stub = ->(*) { "Success" }
    transfer = Transfer.new(transfer: transfer_stub)

    result = transfer.call(amount: 50, from: from, to: to)

    assert_equal(result, "Success")
  end
end
