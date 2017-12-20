require ('pry-byebug')
require_relative('../db/sql_runner.rb')

class Budget

  attr_reader :id, :amount

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

  # Helper methods
  def amount_pence_to_pounds()
    return @amount.to_f / 100
  end

  def amount_pounds_to_pence()
    return (@amount * 100).to_i
  end

end
