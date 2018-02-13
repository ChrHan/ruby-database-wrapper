require "sqlite3"

class DatabaseHelper
  def initialize(database_name)
    @db = SQLite3::Database.new "#{database_name}"
  end

  def selectcount
    @db.get_first_value("select count(1) from products") do |row|
      p row
    end
  end

  def select
    @db.execute("select * from products") do |row|
      p row
    end
  end

  def insert(id, product_name)
    @db.execute("insert into products values (?, ?)", [id, product_name])
  end

  def update(id, product_name)
    @db.execute("update products set product_name = ? where id = ?", [product_name, id])
  end

  def delete(id)
    @db.execute("delete from products where id = ?", [id])
  end

  def execute(query)
    @db.execute(query)
  end

end
