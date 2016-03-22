# require 'data_mapper'
# require 'dm-postgres-adapter'
# require 'dotenv'
#
# require_relative 'link'
#
# class Bookmark
#   def initialize (datamapper_class: DataMapper, link_class: Link)
#     datamapper_class.setup(:default,
#       "postgres://ENV['USER']:ENV['PASSWORD']@ENV['HOSTNAME']/ENV['DATABASE']")
#     datamapper_class.finalize.auto_upgrade!
#     @link_class = link_class
#   end
# end
