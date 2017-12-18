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

get('/transactions/:tag_id') do
  @tags = Tag.all()
  @transactions = Transaction.all_by_tag(params[:tag_id])
  @transactions_total = Transaction.total_by_tag(params[:tag_id])
  erb(:"transactions/index")
end
