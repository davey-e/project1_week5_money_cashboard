require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/tag.rb')
require_relative('../models/budget.rb')

get('/budget/:id') do
  @tags = Tag.all()
  @budget = Budget.find(params[:id])
  erb(:"budget/show")
end

get('/budget/:id/edit') do
  @tags = Tag.all()
  @budget = Budget.find(params[:id])
  erb(:"budget/edit")
end

post('/budget/:id') do
  budget = Budget.new(params)
  budget.update()
  redirect to("/budget/#{budget.id}")
end
