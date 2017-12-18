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

  def Transaction.all()
    sql = "SELECT * FROM transactions;"
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
    WHERE tag_id = $1"
    values = [tag_id]
    results = SqlRunner.run(sql, values)
    return results.map{|transaction| Transaction.new(transaction)}
  end

  def Transaction.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run (sql)
  end

end
