require "task_formatter"

describe TaskFormatter do
    context "task is complete" do
        it "formats a string" do
            task = double(:task, complete?: true, title: "task")
            task_formatter = TaskFormatter.new(task)
            expect(task_formatter.format).to eq "[x] task"
        end
    end

    context "task is incomplete" do
        it "formats a string" do
            task = double(:task, complete?: false, title: "task")
            task_formatter = TaskFormatter.new(task)
            expect(task_formatter.format).to eq "[ ] task"
        end
    end
end
