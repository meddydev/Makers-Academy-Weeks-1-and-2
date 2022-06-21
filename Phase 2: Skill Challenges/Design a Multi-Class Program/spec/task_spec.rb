require "task"

describe Task do
    it "constructs" do
        task0 = Task.new("record video of myself")
        expect(task0.task).to eq "record video of myself"
    end

    it "returns true if task is marked as done (and false if not)" do
        task0 = Task.new("record video of myself")
        task1 = Task.new("wash dishes")
        task0.mark_done!
        expect(task0.done?).to eq true
        expect(task1.done?).to eq false
    end
end