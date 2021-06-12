require 'unqlite'

class DataStore
    def initialize(database)
        @db = UnQLite::Database.new(database)
    end

    def set(key, value)
        @db.store key, value
        @db.commit
    end

    def get(key)
        @db.fetch key
    end
end