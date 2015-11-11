class TransferController < ApplicationController
  def transfer
    from_account = Account.find(params[:from_number])
    to_account = Account.find(params[:to_number])
    Transfer.new(params[:amount].to_f, from_account, to_account)
  end
end
