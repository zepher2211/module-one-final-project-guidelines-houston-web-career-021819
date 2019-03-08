require 'bundler'
require 'tty'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger.level = 1
require_all 'lib'
require_all 'app'
