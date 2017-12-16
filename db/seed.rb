require('pry-byebug')
require_relative('../models/tag.rb')
require_relative('../models/vendor.rb')


tag1 = Tag.new({
  'name' => 'Clothes'
  })
tag1.save()

vendor1 = Vendor.new({
  'name' => 'Next'
  })
vendor1.save()

binding.pry
nil
