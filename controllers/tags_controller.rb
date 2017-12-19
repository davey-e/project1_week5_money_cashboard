require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag.rb')

get('/tags/new') do
  @tags = Tag.all()
  erb(:"tags/new")
end

post('/tags') do
  tag = Tag.new(params)
  tag.save()
  redirect to('/transactions')
end
