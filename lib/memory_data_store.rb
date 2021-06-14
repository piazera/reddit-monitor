class MemoryDataStore
    def store_results(value)
        @results = {} unless @results
        @last = Time.now.utc
        @results[@last] = value
        @last
    end

    def all_results
        @results.values if @results
    end

    def last_result
        @results[@last] if @last
    end
end