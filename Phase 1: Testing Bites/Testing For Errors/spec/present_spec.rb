require 'present'

describe Present do
    it "returns appropriate error message when trying to unwrap without first wrapping" do
        present = Present.new
        expect { present.unwrap }.to raise_error "No contents have been wrapped."
    end

    it "returns appropriate error message when trying to wrap something after something's already been wrapped" do
        present = Present.new
        present.wrap("headphones")
        expect { present.wrap("playstation 5") }.to raise_error "A contents has already been wrapped."
    end

    it "returns correct contents when unwrapping a wrapped object" do
        present = Present.new
        present.wrap("scooter")
        expect(present.unwrap).to eq "scooter"
    end
end