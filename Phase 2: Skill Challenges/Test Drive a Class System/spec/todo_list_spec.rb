require "todo_list"

describe TodoList do
    context "nothing has been added" do
        it "returns empty incomplete list" do
            todolist = TodoList.new
            expect(todolist.incomplete).to eq []
        end
        it "returns empty complete list" do
            todolist = TodoList.new
            expect(todolist.complete).to eq []
        end
        it "returns empty complete list when giving up after no tasks added" do
            todolist = TodoList.new
            todolist.give_up!
            expect(todolist.complete).to eq []
        end
    end
end