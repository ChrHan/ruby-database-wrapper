require "yaml"

class ConfigLoader
  attr_reader :filename
  def initialize(file)
    config = YAML.load_file(file)
    @filename = config['database']['filename']
  end
end

