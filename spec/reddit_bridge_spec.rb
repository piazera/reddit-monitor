require 'reddit_bridge'

describe RedditBridge do
    describe 'reddit bridge' do
      let(:response) { RedditBridge.new.search('cpi') }
      it "returns correctly some data" do
        expect(response).to eq([])
      end
    end
end