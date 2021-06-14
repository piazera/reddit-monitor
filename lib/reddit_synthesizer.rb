require './reddit_bridge.rb'
require './memory_data_store.rb'
require 'securerandom'
require './texts_to_monitor.rb'

class RedditSynthesizer
    def process()
        @data_store = MemoryDataStore.new unless @data_store
        TEXTS_TO_MONITOR.each do |text|
            results = RedditBridge.new.search text
            key = SecureRandom.uuid
            @data_store.store results.to_json
        end
        @data_store
    end
end

RedditSynthesizer.new.process