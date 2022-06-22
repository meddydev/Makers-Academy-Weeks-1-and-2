require "diary"

describe Diary do
  it "succesfully reads contents" do
    diary = Diary.new("Ahmed")
    expect(diary.read).to eq "Ahmed"
  end
end