require "memory_data_store"

describe MemoryDataStore do
    describe "Data store" do
      it "returns last data stored" do
        data_to_store = "last data stored"
        store = MemoryDataStore.new
        store.store_results data_to_store
        last = store.last_result
        expect(last).to eq(data_to_store)
      end

      it "returns all data stored" do
        store = MemoryDataStore.new
        first = "first data stored"
        store.store_results first
        second = "second data stored"
        store.store_results second
        last = "last data stored"
        store.store_results last
        all = store.all_results
        puts all
        expect(all.length).to eq(3)
        expect(all.include?(first)).to be true
        expect(all.include?(second)).to be true
        expect(all.include?(last)).to be true
      end
    end
end
