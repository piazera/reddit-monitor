require "reddit_bridge"

describe RedditBridge do
    describe "reddit bridge" do
      let(:response) { RedditBridge.new.search("cpi") }
      it "returns correctly some data" do
        expect(response.length()).to eq(5)
				expect(response[2]["author"]).to eq("IamnottheJoe")
				expect(response[4]["url"]).to eq("https://www.reddit.com/r/EnquetesBrasil/comments/nps78o/cpi_da_pandemia_nise_yamaguchi/")
      end
    end
end
