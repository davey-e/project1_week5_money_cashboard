require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag.rb')
require_relative('../models/vendor.rb')

get('/vendors/new') do
  @tags = Tag.all()
  @budget = Budget.all.first()
  erb(:"vendors/new")
end

post('/vendors') do
  vendor = Vendor.new(params)
  vendor.save()
  redirect to('/transactions')
end
