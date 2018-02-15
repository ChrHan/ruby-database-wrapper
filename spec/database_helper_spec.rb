require "database_helper"
require "yaml"

RSpec.describe DatabaseWrapper do
  ENV['RACK_ENV'] = 'test'
  before :all do
    db = DatabaseWrapper.new()
    db.execute("CREATE TABLE PRODUCTS (
      id  INT PRIMARY KEY,
      product_name VARCHAR(20)
    );")
  end

  context "when table is empty" do
    it "returns 0" do
      db = DatabaseWrapper.new()
      expect(db.selectcount).to be 0
    end
  end

  context "when a product is created" do
    it "returns product when selected" do
      db = DatabaseWrapper.new()
      db.insert(9999, "123123")
      expect(db.selectcount).not_to be 0
      expect(db.select).not_to be nil
    end
  end

  after :all do
    db = DatabaseWrapper.new()
    db.execute("drop table products")
  end
end


