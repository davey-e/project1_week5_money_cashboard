require('pry-byebug')
require_relative('../models/tag.rb')

tag1 = Tag.new({
  'name' => 'Clothes'
  })
tag1.save()

binding.pry
nil
