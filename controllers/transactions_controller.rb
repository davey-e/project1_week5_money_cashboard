require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/vendor.rb')


get('/transactions') do
  @tags = Tag.all()
  @transactions = Transaction.all()
  @transactions_total = Transaction.total()
  erb(:"transactions/index")
end

get('/transactions/new') do
  @tags = Tag.all()
  @vendors = Vendor.all()
  erb(:"transactions/new")
end

post('/transactions') do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to('/transactions')
end

get('/transactions/tag/:id') do
  @tags = Tag.all()
  @transactions = Transaction.all_by_tag(params[:id])
  @transactions_total = Transaction.total_by_tag(params[:id])
  erb(:"transactions/index")
end

get('/transactions/:id') do
  @tags = Tag.all()
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to("/transactions")
end
