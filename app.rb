require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/tag.rb')
require_relative('./models/vendor.rb')
require_relative('./models/transaction.rb')

get '/' do
  erb(:index)
end
