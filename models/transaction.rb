require('pry-byebug')
require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :amount, :tag_id, :vendor_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @tag_id = options['tag_id'].to_i
    @vendor_id = options['vendor_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (amount, tag_id, vendor_id)
    VALUES
    ($1, $2, $3)
    RETURNING id;"
    values = [@amount, @tag_id, @vendor_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i
  end

  def Transaction.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run (sql)
  end

end
