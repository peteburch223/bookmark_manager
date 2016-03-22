# require 'data_mapper'
# require 'dm-postgres-adapter'
# require 'dotenv'
#
# configure do
#   DataMapper.setup(:default,
#     "postgres://ENV['USER']:ENV['PASSWORD']@ENV['HOSTNAME']/ENV['DATABASE']")
# end
#
#
# class Link
#   include DataMapper::Resource
#
#   property: id,     Serial
#   property: title,  String
#   property: url,    String
#   property: date,   Date
#
#   # def initialize (datamapper_class: DataMapper)
#   #   datamapper_class.setup(:default,
#   #     "postgres://ENV['USER']:ENV['PASSWORD']@ENV['HOSTNAME']/ENV['DATABASE']")
#   #   datamapper_class.finalize.auto_upgrade!
#   #   @link_class = link_class
#   # end
#
# end
#
# configure do
#   DataMapper.finalize.auto_upgrade!
# end
