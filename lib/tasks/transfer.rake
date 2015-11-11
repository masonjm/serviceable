desc "Transfer ENV['AMOUNT'] from ENV['FROM_ACCOUNT'] to ENV['TO_ACCOUNT']"
task transfer: :environment do
  from_account = Account.find(ENV["FROM_ACCOUNT"]) || raise("Missing parament ENV['FROM_ACCOUNT']")
  to_account = Account.find(ENV["TO_ACCOUNT"]) || raise("Missing parament ENV['TO_ACCOUNT']")
  amount = ENV["AMOUNT"] || raise("Missing parament ENV['AMOUNT']")

  Transfer.new(amount.to_f, from_account, to_account)
end
