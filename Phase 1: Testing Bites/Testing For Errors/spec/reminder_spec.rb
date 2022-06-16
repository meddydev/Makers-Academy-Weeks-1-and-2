require 'reminder'

describe Reminder do
    it "fails when no task is set" do
        reminder = Reminder.new("Ahmed")
        expect {reminder.remind()}.to raise_error "No reminder set!"
    end
end