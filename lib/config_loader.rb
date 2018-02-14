require "yaml"

class ConfigLoader
  attr_reader :filename
  def initialize(file)
    begin
      config = YAML.load_file(file)
      @filename = config['database']['filename']
    rescue SystemCallError
      $stderr.print "No valid config file found on #{file}\n"
      $stderr.print "Please copy a valid configuration from config.example.yaml, and change filename to SQLite3 database\n"
      raise
    end
  end
end

