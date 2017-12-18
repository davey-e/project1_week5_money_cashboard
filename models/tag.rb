require('pry-byebug')
require_relative('../db/sql_runner.rb')

class Tag

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags
    (name)
    VALUES
    ($1)
    RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i
  end

  def Tag.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run (sql)
  end

  def Tag.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Tag.new(result)
  end

end
