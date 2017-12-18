require('pry-byebug')
require_relative('../db/sql_runner.rb')

class Vendor

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO vendors
    (name)
    VALUES
    ($1)
    RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i
  end

  def Vendor.delete_all()
    sql = "DELETE FROM vendors;"
    SqlRunner.run (sql)
  end

  def Vendor.find(id)
    sql = "SELECT * FROM vendors
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Vendor.new(result)
  end


end
