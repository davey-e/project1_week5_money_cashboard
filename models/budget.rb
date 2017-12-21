require ('pry-byebug')
require_relative('../db/sql_runner.rb')

class Budget

  attr_reader :id
  attr_accessor :amount

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_f
  end

  def save()
    @amount = amount_pounds_to_pence()
    sql = "INSERT INTO budget
    (amount)
    VALUES
    ($1)
    RETURNING id;"
    values = [@amount]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i
  end

  def update()
    @amount = amount_pounds_to_pence()
    sql = "UPDATE budget
    SET amount = $1
    WHERE id = $2"
    values = [@amount, @id]
    SqlRunner.run(sql, values)
  end

  def Budget.delete_all()
    sql = "DELETE FROM budget"
    SqlRunner.run (sql)
  end

  def Budget.find(id)
    sql = "SELECT * FROM budget
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Budget.new(result)
  end

  def Budget.all()
    sql = "SELECT * FROM budget"
    result = SqlRunner.run(sql)
    return result.map{|budget|Budget.new(budget)}
  end

  # Helper methods
  def amount_pence_to_pounds()
    return @amount.to_f / 100
  end

  def amount_pounds_to_pence()
    return (@amount * 100).to_i
  end

end
