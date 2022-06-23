require "cat_facts"

describe CatFacts do
    it "returns cat fact" do
        requester = double(:fake_requester)
        expect(requester).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"Cats can predict earthquakes. We humans are not 100% sure how they do it. There are several different theories.","length":111}')
        cat_fact = CatFacts.new(requester)
        expect(cat_fact.provide).to eq "Cat fact: Cats can predict earthquakes. We humans are not 100% sure how they do it. There are several different theories."
    end
end
