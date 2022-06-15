require 'greet'

describe "greet method" do
    it "returns 'Hello, edouard!' when 'Edouard' is passed through" do
        result = greet('Edouard')
        expect(result).to eq 'Hello, Edouard!'
    end
end