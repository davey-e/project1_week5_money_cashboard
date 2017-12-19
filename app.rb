require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/tag.rb')
require_relative('./models/vendor.rb')
require_relative('./models/transaction.rb')

require_relative('./controllers/transactions_controller.rb')
require_relative('./controllers/tags_controller.rb')
require_relative('./controllers/vendors_controller.rb')

get '/' do
  @tags = Tag.all()
  erb(:index)
end
