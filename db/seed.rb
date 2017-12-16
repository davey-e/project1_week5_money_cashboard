require('pry-byebug')
require_relative('../models/tag.rb')
require_relative('../models/vendor.rb')
require_relative('../models/transaction.rb')

Transaction.delete_all()
Tag.delete_all()
Vendor.delete_all()

tag1 = Tag.new({
  'name' => 'Clothes'
  })
tag1.save()

vendor1 = Vendor.new({
  'name' => 'Next'
  })
vendor1.save()

transaction1 = Transaction.new({
  'amount' => '2000',
  'tag_id' => tag1.id,
  'vendor_id' => vendor1.id
  })
  transaction1.save()

binding.pry
nil
