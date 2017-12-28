require('pg')

class SqlRunner

  def self.run (sql, values = [])
    begin
      # db = PG.connect({dbname: 'money_cashboard', host: 'localhost'})
      db = PG.connect({dbname: 'd1kd6bidhmdki1', host: 'ec2-23-21-164-107.compute-1.amazonaws.com', port: 5432, user: 'wkcutdkhhqucdc', password: '3fe24895f5846529ed0a3829140f3b542c48a5e2e445f1eab9f34c5d4bc405ad'})
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
