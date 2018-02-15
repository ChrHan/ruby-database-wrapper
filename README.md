# DatabaseWrapper

A gem for BukaLapak's SRE Onboarding Project.

This gem wraps CRUD operation to Ruby native code.

Tables supported for this gem is described below.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'database_wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install database_wrapper

An `SQLite3` Database needs to be created, named as `database.db` 

## Usage

### DB Setup

    CREATE TABLE PRODUCTS (
      id  INT PRIMARY KEY,
      product_name VARCHAR(20)
    );

### Building Gem

    gem build database_wrapper.gemspec

### Using Gem

    gem install database_wrapper-0.1.4.gem

    irb
    > require 'database_wrapper'
    > db = DatabaseWrapper.new
    > db.select

functions of DatabaseWrapper is listed below

### Functions available

`DatabaseWrapper.delete(id)` -> delete from products where id = 'id'
`DatabaseWrapper.execute(query)` -> execute query string stored in variable `query` 
`DatabaseWrapper.insert(id, product_name)` -> insert into products values ('id', 'product_name')
`DatabaseWrapper.select` -> select * from products
`DatabaseWrapper.selectcount` -> select count(1) from products
`DatabaseWrapper.update(id, product_name)` -> update products set product_name = 'product_name' where id = 'id'

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Test

Run test with `rspec` command

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ChrHan/ruby-database-wrapper.
