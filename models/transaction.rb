require('pry-byebug')
require('date')
require_relative('../db/sql_runner')

class Transaction

  attr_reader :id
  attr_accessor :transaction_date, :amount, :tag_id, :vendor_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @transaction_date = Date.parse(options['transaction_date'])
    @amount = options['amount'].to_f
    @tag_id = options['tag_id'].to_i
    @vendor_id = options['vendor_id'].to_i
  end

  def save()
    @amount = amount_pounds_to_pence()
    sql = "INSERT INTO transactions
    (transaction_date, amount, tag_id, vendor_id)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id;"
    values = [@transaction_date, @amount, @tag_id, @vendor_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i
  end

  def tag()
    sql = "SELECT * FROM tags
    WHERE id = $1;"
    values = [@tag_id]
    result = SqlRunner.run(sql, values).first()
    return Tag.new(result)
  end

  def vendor()
    sql = "SELECT * FROM vendors
    WHERE id = $1;"
    values = [@vendor_id]
    result = SqlRunner.run(sql, values).first()
    return Vendor.new(result)
  end

  def find()
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first()
    return Transaction.new(result)
  end

  def update()
    @amount = amount_pounds_to_pence()
    sql = "UPDATE transactions
    SET(amount, tag_id, vendor_id) = ($1, $2, $3)
    WHERE id = $4"
    values = [@amount, @tag_id, @vendor_id, @id]
    SqlRunner.run(sql, values)
  end

  def Transaction.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Transaction.new(result)
  end

  def Transaction.all()
    sql = "SELECT * FROM transactions
    ORDER BY transaction_date desc;"
    results = SqlRunner.run(sql)
    return results.map{|transaction| Transaction.new(transaction)}
  end

  def Transaction.total()
    sql = "SELECT SUM(amount) FROM transactions;"
    result = SqlRunner.run(sql).first()
    return result['sum'].to_i
  end

  def Transaction.all_by_tag(tag_id)
    sql = "SELECT * FROM transactions
    WHERE tag_id = $1
    ORDER BY transaction_date desc;;"
    values = [tag_id]
    results = SqlRunner.run(sql, values)
    return results.map{|transaction| Transaction.new(transaction)}
  end

  def Transaction.total_by_tag(tag_id)
    sql = "SELECT sum(amount) FROM transactions
    WHERE tag_id = $1;"
    values = [tag_id]
    result = SqlRunner.run(sql, values).first()
    return result['sum'].to_i
  end

  def Transaction.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run (sql)
  end

  def Transaction.delete(id)
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  # Helper methods

  def amount_pence_to_pounds()
    return @amount.to_f / 100
  end

  def amount_pounds_to_pence()
    return (@amount * 100).to_i
  end

  def format_date()
    return @transaction_date.strftime("%d/%m/%Y")
  end

end
