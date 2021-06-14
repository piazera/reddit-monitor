require "reddit_bridge"

describe RedditBridge do
    describe "reddit bridge" do
      let(:response) { RedditBridge.new.search("cpi") }
      it "returns data correctly" do
        expect(response[:after]).to eq('t3_nps78o')
        expect(response[:children].length()).to eq(5)
        expect(response[:children][2][:author]).to eq("IamnottheJoe")
        expect(response[:children][4][:url]).to eq("https://www.reddit.com/r/EnquetesBrasil/comments/nps78o/cpi_da_pandemia_nise_yamaguchi/")
      end
    end
end
