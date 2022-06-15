require 'check_codeword.rb'

describe "check_codeword method" do
    it "returns 'Correct! Come in.' when passed 'horse'" do
        result = check_codeword('horse')
        expect(result).to eq "Correct! Come in."
    end

    it "returns 'Close, but nope.' when passed 'hypothesise'" do
        result = check_codeword('hypothesise')
        expect(result).to eq 'Close, but nope.'
    end

    it "returns 'WRONG! when passed 'husband'" do
        result = check_codeword('husband')
        expect(result).to eq 'WRONG!'
    end
end