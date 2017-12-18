require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/transaction.rb')

get('/transactions') do
  @transactions = Transaction.all()
  @transactions_total = Transaction.total()
  erb(:"transactions/index")
end
