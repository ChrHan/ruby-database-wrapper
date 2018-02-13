require "hola/version"
require "translator"
require "yaml"
require "databasehelper"

class Hola
  def self.hi(language = "english")
    translator = Translator.new(language)
    translator.hi
  end

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
end
