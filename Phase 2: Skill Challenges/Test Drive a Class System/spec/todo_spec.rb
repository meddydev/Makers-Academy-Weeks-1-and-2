require "todo"

describe Todo do
    it "constructs" do
        todo = Todo.new("walk the dog")
        expect(todo.task).to eq "walk the dog"
    end

    it "successfully marks a task is done" do 
        todo = Todo.new("Walk the dog")
        todo.mark_done!
        expect(todo.done?).to eq true
    end

    it "returns false when the task is not done" do
        todo = Todo.new("Walk the dog")
        expect(todo.done?).to eq false
    end
end