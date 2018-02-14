require "config_loader"
require "database_helper"
require "database_wrapper/version"

class DatabaseWrapper
  def initialize(config_file='config.yaml')
    config = ConfigLoader.new(config_file)
    @db = DatabaseHelper.new(config.filename)
  end

  def select
    @db.select
  end

  def insert(id, product_name)
    @db.insert(id, product_name)
  end

  def update(id, product_name)
    @db.update(id, product_name)
  end

  def delete(id)
    @db.delete(id)
  end

  def execute(query)
    @db.execute(query)
  end

  def selectcount
    @db.selectcount
  end

end
