require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'cinema', host: 'localhost'})
      db.prepare("query", sql) #make a prepared statement and call the statement query. telling the sql to use it.
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
  end

end
