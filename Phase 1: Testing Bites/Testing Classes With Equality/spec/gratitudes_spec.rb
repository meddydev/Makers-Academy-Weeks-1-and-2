require 'gratitudes'

describe Gratitudes do
    it "initially returns string with nothing to be grateful for" do
        grat = Gratitudes.new
        expect(grat.format).to eq "Be grateful for: "
    end

    it "adds comma separated string when mutliple strings are added" do
        grat = Gratitudes.new
        grat.add("family")
        grat.add("friends")
        grat.add("the internet")
        expect(grat.format).to eq "Be grateful for: family, friends, the internet"
    end
end