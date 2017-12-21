require('pry-byebug')
require_relative('../models/tag.rb')
require_relative('../models/vendor.rb')
require_relative('../models/transaction.rb')
require_relative('../models/budget.rb')


Transaction.delete_all()
Tag.delete_all()
Vendor.delete_all()
Budget.delete_all()

budget1 = Budget.new({'amount' => '1500.00'})
budget1.save()

tag1 = Tag.new({'name' => 'Clothes'})
tag1.save()
tag2 = Tag.new({'name' => 'Groceries'})
tag2.save()
tag3 = Tag.new({'name' => 'Entertainment'})
tag3.save()
tag4 = Tag.new({'name' => 'Presents'})
tag4.save()
tag5 = Tag.new({'name' => 'Bills'})
tag5.save()

vendor1 = Vendor.new({'name' => 'Next'})
vendor1.save()
vendor2 = Vendor.new({'name' => 'Tesco'})
vendor2.save()
vendor3 = Vendor.new({'name' => 'Asda'})
vendor3.save()
vendor4 = Vendor.new({'name' => 'Coop'})
vendor4.save()
vendor5 = Vendor.new({'name' => 'Cineworld'})
vendor5.save()
vendor6 = Vendor.new({'name' => 'Vue Cinema'})
vendor6.save()
vendor7 = Vendor.new({'name' => 'Amazon'})
vendor7.save()
vendor8 = Vendor.new({'name' => 'Toys R US'})
vendor8.save()
vendor9 = Vendor.new({'name' => 'BT'})
vendor9.save()
vendor10 = Vendor.new({'name' => 'Eon'})
vendor10.save()

transaction1 = Transaction.new({
  'transaction_date' => '20/11/2017',
  'amount' => '20.00',
  'tag_id' => tag1.id,
  'vendor_id' => vendor1.id})
transaction1.save()
transaction2 = Transaction.new({
  'transaction_date' => '21/11/2017',
  'amount' => '44.56',
  'tag_id' => tag2.id,
  'vendor_id' => vendor2.id})
transaction2.save()
transaction3 = Transaction.new({
  'transaction_date' => '23/11/2017',
  'amount' => '176.27',
  'tag_id' => tag5.id,
  'vendor_id' => vendor9.id})
transaction3.save()
transaction4 = Transaction.new({
  'transaction_date' => '24/11/2017',
  'amount' => '14.56',
  'tag_id' => tag2.id,
  'vendor_id' => vendor4.id})
transaction4.save()
transaction5 = Transaction.new({
  'transaction_date' => '27/11/2017',
  'amount' => '45.65',
  'tag_id' => tag2.id,
  'vendor_id' => vendor3.id})
transaction5.save()
transaction6 = Transaction.new({
  'transaction_date' => '30/11/2017',
  'amount' => '34.98',
  'tag_id' => tag4.id,
  'vendor_id' => vendor7.id})
transaction6.save()
transaction7 = Transaction.new({
  'transaction_date' => '01/12/2017',
  'amount' => '12.99',
  'tag_id' => tag1.id,
  'vendor_id' => vendor1.id})
transaction7.save()
transaction8 = Transaction.new({
  'transaction_date' => '02/12/2017',
  'amount' => '78.88',
  'tag_id' => tag2.id,
  'vendor_id' => vendor2.id})
transaction8.save()
transaction9 = Transaction.new({
  'transaction_date' => '02/12/2017',
  'amount' => '2.56',
  'tag_id' => tag2.id,
  'vendor_id' => vendor4.id})
transaction9.save()
transaction10 = Transaction.new({
  'transaction_date' => '04/12/2017',
  'amount' => '34.78',
  'tag_id' => tag4.id,
  'vendor_id' => vendor8.id})
transaction10.save()
transaction11 = Transaction.new({
  'transaction_date' => '10/12/2017',
  'amount' => '109.23',
  'tag_id' => tag5.id,
  'vendor_id' => vendor10.id})
transaction11.save()
transaction12 = Transaction.new({
  'transaction_date' => '10/12/2017',
  'amount' => '14.98',
  'tag_id' => tag2.id,
  'vendor_id' => vendor4.id})
transaction12.save()
transaction13 = Transaction.new({
  'transaction_date' => '11/12/2017',
  'amount' => '33.78',
  'tag_id' => tag2.id,
  'vendor_id' => vendor2.id})
transaction13.save()
transaction14 = Transaction.new({
  'transaction_date' => '15/12/2017',
  'amount' => '23.45',
  'tag_id' => tag3.id,
  'vendor_id' => vendor6.id})
transaction14.save()
transaction15 = Transaction.new({
  'transaction_date' => '15/12/2017',
  'amount' => '34.00',
  'tag_id' => tag1.id,
  'vendor_id' => vendor1.id})
transaction15.save()
transaction16 = Transaction.new({
  'transaction_date' => '16/12/2017',
  'amount' => '9.78',
  'tag_id' => tag2.id,
  'vendor_id' => vendor3.id})
transaction16.save()
transaction17 = Transaction.new({
  'transaction_date' => '17/12/2017',
  'amount' => '44.56',
  'tag_id' => tag4.id,
  'vendor_id' => vendor7.id})
transaction17.save()
transaction18 = Transaction.new({
  'transaction_date' => '17/12/2017',
  'amount' => '33.10',
  'tag_id' => tag4.id,
  'vendor_id' => vendor8.id})
transaction18.save()
transaction19 = Transaction.new({
  'transaction_date' => '20/12/2017',
  'amount' => '190.45',
  'tag_id' => tag2.id,
  'vendor_id' => vendor2.id})
transaction19.save()
transaction20 = Transaction.new({
  'transaction_date' => '21/12/2017',
  'amount' => '56.12',
  'tag_id' => tag4.id,
  'vendor_id' => vendor7.id})
transaction20.save()

binding.pry
nil
