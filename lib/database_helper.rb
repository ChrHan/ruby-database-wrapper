require "sqlite3"

class DatabaseHelper
  def initialize(database_name)
    @db = SQLite3::Database.new "#{database_name}"
  end

  def selectcount
    begin
      @db.get_first_value("select count(1) from products") 
    rescue SQLite3::Exception
          $stderr.print "Table Products not found. Please read README.md for guide to create one.\n"
    end
  end

  def select
    begin
      @db.execute("select * from products")
    rescue SQLite3::Exception
      $stderr.print "Table Products not found. Please read README.md for guide to create one.\n"
    end
  end

  def insert(id, product_name)
    begin
      @db.execute("insert into products values (?, ?)", [id, product_name])
    rescue SQLite3::Exception
      $stderr.print "Table Products not found. Please read README.md for guide to create one.\n"
    end
  end

  def update(id, product_name)
    begin
      @db.execute("update products set product_name = ? where id = ?", [product_name, id])
    rescue SQLite3::Exception
      $stderr.print "Table Products not found. Please read README.md for guide to create one.\n"
    end
  end

  def delete(id)
    begin
      @db.execute("delete from products where id = ?", [id])
    rescue SQLite3::Exception
      $stderr.print "Table Products not found. Please read README.md for guide to create one.\n"
    end
  end

  def execute(query)
    begin
      @db.execute(query)
    rescue SQLite3::Exception
          $stderr.print "Syntax Error. Please check your SQL Syntax: \n #{query} \n"
    end

  end

end
