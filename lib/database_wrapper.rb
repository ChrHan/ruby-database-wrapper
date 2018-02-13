require "database_wrapper/version"
require "yaml"
require "databasehelper"

class DatabaseWrapper
	def self.select
    @config = YAML::load_file('config.yaml')
    db = DatabaseHelper.new(@config['database']['filename'])
    db.select
	end

	def self.insert(id, product_name)
    @config = YAML::load_file('config.yaml')
    db = DatabaseHelper.new(@config['database']['filename'])
    db.insert(id, product_name)
	end

	def self.update(id, product_name)
    @config = YAML::load_file('config.yaml')
    db = DatabaseHelper.new(@config['database']['filename'])
    db.update(id, product_name)
	end

	def self.delete(id)
    @config = YAML::load_file('config.yaml')
    db = DatabaseHelper.new(@config['database']['filename'])
    db.delete(id)
	end

  def self.execute(query)
    @config = YAML::load_file('config.yaml')
    db = DatabaseHelper.new(@config['database']['filename'])
    db.execute(query)
  end
end
