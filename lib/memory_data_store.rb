class MemoryDataStore
    def initialize
        @data = {
            :results    => {},
            :totals     => {},
            :after      => {}
        }
    end

    def store_results(value)
        @data[:results][Time.now.utc] = value
    end

    def store_totals(totals)
        @data[:totals][Time.now.utc] = totals
    end

    def store_after(text, after)
        @data[:after] = {} unless @data[:after]
        @data[:after][text] = after
    end

    def last_key(collection)
        @data[collection].keys.last if @data[collection].values
    end

    def last(collection)
        @data[collection].values.last if @data[collection].values
    end
    
    def last_result
        last :results
    end

    def last_totals_created
        last_key :totals
    end

    def last_totals
        last :totals
    end

    def last_after(text)
        @data[:after][text]
    end
end