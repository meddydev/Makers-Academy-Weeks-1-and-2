require 'make_snippet'

describe "make_snippet method" do
    it "returns all words of a 5 word string" do
        expect(make_snippet("A boy walked down the")).to eq "A boy walked down the"
    end

    it "returns first 5 words plus an ellipsis for a string of 6 or more words" do
        expect(make_snippet("A boy walked down the road")).to eq "A boy walked down the ..."
    end

    it "returns an empty string if empty string is given to the method" do
        expect(make_snippet("")).to eq ""
    end
end