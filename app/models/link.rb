require 'data_mapper'
require 'dm-postgres-adapter'

# This class corresponds to a table in the database
class Link
  # add DataMapper functionality to this class
  include DataMapper::Resource

  # these property declarations set the column headers in the 'links' table
  property :id,       Serial
  property :title,    String
  property :url,      String

  #Database connection setup
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

  #verification
  DataMapper.finalize

  #build new columns/tables
  DataMapper.auto_upgrade!

end
