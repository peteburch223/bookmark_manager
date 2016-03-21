require 'data_mapper'
require 'dm-postgres-adapter'
require 'dotenv'

class Bookmark

  def initialize (datamapper_class: DataMapper)
    datamapper_class.setup(:default,
    "postgres://ENV['USER']:ENV['PASSWORD']@ENV['HOSTNAME']/ENV['DATABASE']")
    datamapper_class.finalize.auto_upgrade!
  end
end
