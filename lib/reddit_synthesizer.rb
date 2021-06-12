require './reddit_bridge.rb'
require './data_store.rb'
require 'securerandom'

class RedditSynthesizer
    def process(text)
        results = RedditBridge.new.search text
        key = SecureRandom.uuid
        DataStore.new('data/database.db').set key, results.to_json
    end
end

RedditSynthesizer.new.process 'cpi'