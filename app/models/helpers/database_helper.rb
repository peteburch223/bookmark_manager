USER = 'simonglancy'
DB_NAME = 'bookmarks'
DataMapper.setup(:default, "postgres://#{USER}@localhost/#{DB_NAME}")
