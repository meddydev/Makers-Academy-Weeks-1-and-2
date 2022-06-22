require "secret_diary"

describe SecretDiary do
  it "raises error when diary is locked" do
    diary = double(:fake_diary)
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error "Go away!"
  end

  it "reads diary after unlocking" do
    diary = double(:fake_diary, read: "Karolina")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Karolina"
  end

  it "returns true if diary is locked" do
    secret_diary = SecretDiary.new(:fake_diary)
    expect(secret_diary.locked?).to eq true
  end
  
  it "returns false if diary is unlocked" do
    secret_diary = SecretDiary.new(:fake_diary)
    secret_diary.unlock
    expect(secret_diary.locked?).to eq false
  end  
end