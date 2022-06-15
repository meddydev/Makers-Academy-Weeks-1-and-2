require 'counter'

describe Counter do
    it "reports a count of 0 if you don't add any numbers" do
        counter = Counter.new
        result = counter.report
        expect(result).to eq "Counted to 0 so far."
    end

    it "returns correct count after adding multiple numbers" do
        counter = Counter.new
        counter.add(5)
        counter.add(55)
        counter.add(40)
        result = counter.report
        expect(result).to eq "Counted to 100 so far."
    end

    it "reports correct count after already reporting then adding a new number" do
        counter = Counter.new
        counter.add(5)
        counter.report
        counter.add(10)
        result = counter.report
        expect(result).to eq "Counted to 15 so far."
    end
end