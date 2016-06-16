require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'lib/tag'
require_relative 'lib/link'
require_relative 'lib/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV["RACK_ENV"]}")

DataMapper.finalize
DataMapper.auto_upgrade!