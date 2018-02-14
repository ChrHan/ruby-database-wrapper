require "config_loader"
require "database_helper"
require "database_wrapper/version"

class DatabaseWrapper
  def initialize
    config = ConfigLoader.new('config.yaml')
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

  def self.execute(query)
    @db.execute(query)
  end
end
