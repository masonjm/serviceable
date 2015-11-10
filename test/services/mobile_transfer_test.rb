require 'test_helper'

class MobilTransferTest < ActiveSupport::TestCase
  test "finds accounts by mobile number" do
    from = Account.create(balance: 100, mobile: "555-555-1234")
    to = Account.create(balance: 0, mobile: "555-555-5678")

    # Create a service stub so we can test that the right values are passed down
    transfer_stub = lambda do |_amount, from_account, to_account|
      [from_account.id, to_account.id]
    end
    transfer = MobileTransfer.new(transfer: transfer_stub)

    result = transfer.call(amount: 50,
                           from_mobile: "555-555-1234",
                           to_mobile: "555-555-5678",
                           )

    assert_equal(result, [from.id, to.id])
  end
end
