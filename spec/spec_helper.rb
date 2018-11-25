# frozen_string_literal: true

require 'active_record'
require 'active_record-type-symbol'
require 'fileutils'
require 'logger'
require 'yaml'
require 'database_cleaner'
require 'with_model'

FileUtils.makedirs('log')

ActiveRecord::Base.logger = Logger.new('log/test.log')
ActiveRecord::Base.logger.level = Logger::DEBUG
ActiveRecord::Migration.verbose = false

db_adapter = ENV.fetch('ADAPTER', 'sqlite3')
db_config = YAML.safe_load(File.read('spec/db/database.yml'))

DATABASE_NAME = 'active_record_type_symbol_test'

RSpec.configure do |config|
  config.extend WithModel
  config.order = 'random'

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    `dropdb --if-exists #{DATABASE_NAME}`
    `createdb #{DATABASE_NAME}`

    ActiveRecord::Base.establish_connection(db_config[db_adapter])

    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
