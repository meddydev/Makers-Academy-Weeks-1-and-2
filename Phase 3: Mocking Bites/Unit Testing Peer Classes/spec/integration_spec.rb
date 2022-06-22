require "diary"
require "secret_diary"

describe "Integration" do
  it "raises error initially when trying to read secret diary" do
    diary = Diary.new("Ahmed")
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error "Go away!"
  end

  it "reads diary after unlocking" do
    diary = Diary.new("Karolina")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Karolina"
  end

  it "locks diary" do
    diary = Diary.new("your name")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect(secret_diary.locked?).to eq true
  end  
end