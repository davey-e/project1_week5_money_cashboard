require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./models/tag.rb')
require_relative('./models/vendor.rb')
require_relative('./models/transaction.rb')
require_relative('./models/budget.rb')

require_relative('./controllers/transactions_controller.rb')
require_relative('./controllers/tags_controller.rb')
require_relative('./controllers/vendors_controller.rb')
require_relative('./controllers/budget_controller.rb')

get '/' do
  redirect to("/transactions")
end
