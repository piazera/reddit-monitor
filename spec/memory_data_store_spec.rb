require "memory_data_store"

describe MemoryDataStore do
    describe "Data store" do
      it "returns last data stored" do
        data_to_store = "last data stored"
        store = MemoryDataStore.new
        store.store_results data_to_store
        expect(store.last_result).to eq(data_to_store)
      end

      it "returns last totals stored" do
        data_to_store = "last totals stored"
        store = MemoryDataStore.new
        store.store_totals data_to_store
        expect(store.last_totals).to eq(data_to_store)
      end


      it "returns last after stored" do
        data_to_store = "last after stored"
        store = MemoryDataStore.new
        store.store_after :cafe, data_to_store
        expect(store.last_after(:cafe)).to eq(data_to_store)
      end
    end
end
