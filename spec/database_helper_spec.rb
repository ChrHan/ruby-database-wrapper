require "databasehelper"
require "yaml"

RSpec.describe DatabaseWrapper do
  before :all do
		db = DatabaseHelper.new(YAML::load_file('config.test.yaml'))
		db.execute("CREATE TABLE PRODUCTS (
      id  INT PRIMARY KEY,
      product_name VARCHAR(20)
    );")
  end

  context "when table is empty" do
    it "returns 0" do
      db = DatabaseHelper.new(YAML::load_file('config.test.yaml'))
      expect(db.selectcount).to be 0
    end
  end

  context "when a product is created" do
    it "returns product when selected" do
      db = DatabaseHelper.new(YAML::load_file('config.test.yaml'))
      db.insert(9999,"123123")
      expect(db.selectcount).not_to be 0
      expect(db.select).not_to be nil
    end
  end

  after :all do
		db = DatabaseHelper.new(YAML::load_file('config.test.yaml'))
		db.execute("drop table products")
  end
end


