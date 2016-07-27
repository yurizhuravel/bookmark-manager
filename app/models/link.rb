require 'data_mapper'
require 'dm-postgres-adapter'

# This class corresponds to a table in the database
class Link
  # add DataMapper functionality to this class
  include DataMapper::Resource

  #establishes many-to-many relationship
  has n, :tags, through: Resource

  # these property declarations set the column headers in the 'links' table
  property :id,       Serial
  property :title,    String
  property :url,      String

end
