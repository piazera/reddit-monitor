require './lib/reddit_bridge.rb'
require './lib/memory_data_store.rb'
require 'securerandom'
require './lib/texts_to_monitor.rb'

class RedditSynthesizer
    def initialize(data_store)
        @data_store = data_store
    end

    def process
        TEXTS_TO_MONITOR.each do |text|
            after = @data_store.last_after(text)
            results = RedditBridge.new.search text, after
            key = SecureRandom.uuid
            #TODO temporarily disabling data store given that data is in memory
            #@data_store.store_results results.to_json
            @data_store.store_after text, results[:after]
            synthesize text, results
        end
    end

    def synthesize(text, results)
        grouped = results[:children].group_by do |result|
            Time.at(result[:created_utc]).strftime('%Y_%m')
        end
        totals = {}
        grouped.keys.each do |year_month|
            totals[year_month] = grouped[year_month].length
        end
        last_totals = @data_store.last_totals
        if last_totals
            last_totals.keys.each do |year_month|
                last_totals[year_month][text] = 0 unless last_totals[year_month][text]
                last_totals[year_month][text] += totals[year_month] if totals[year_month]
            end
        else
            last_totals = {}
            totals.keys.each do |year_month|
                last_totals[year_month] = {}
                last_totals[year_month][text] = totals[year_month]
            end
        end
        @data_store.store_totals last_totals
    end

    def show_totals
        puts @data_store.last_totals
    end
end