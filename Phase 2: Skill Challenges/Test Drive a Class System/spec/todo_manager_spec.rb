require "todo"
require "todo_list"

describe "integrated todos" do
    it "returns incomplete list after adding a todo" do
        todo = Todo.new("walk the dog")
        todo_list = TodoList.new
        todo_list.add(todo)
        expect(todo_list.incomplete).to eq [todo]
    end

    it "returns complete list after adding a todo marked as done" do
        todo = Todo.new("Walk the dog")
        todo.mark_done!
        todo_list = TodoList.new
        todo_list.add(todo)
        expect(todo_list.complete).to eq [todo]
    end

    it "returns correct incomplete list when one todo is done and one isn't" do
        todo_list = TodoList.new
        todo1 = Todo.new("walk dogs")
        todo1.mark_done!
        todo2 = Todo.new("clean room")
        todo_list.add(todo1)
        todo_list.add(todo2)
        expect(todo_list.incomplete).to eq [todo2]
    end

    it "returns empty incomplete list after marking one todo as done" do
        todo_list = TodoList.new
        todo1 = Todo.new("walk dogs")
        todo_list.add(todo1)
        todo_list.incomplete
        todo1.mark_done!
        expect(todo_list.incomplete).to eq []
    end

    it "returns correct complete list after marking two todos as done" do
        todo_list = TodoList.new
        todo1 = Todo.new("walk dogs")
        todo2 = Todo.new("clean room")
        todo_list.add(todo1)
        todo_list.add(todo2)
        todo1.mark_done!
        todo2.mark_done!
        expect(todo_list.complete).to eq [todo1, todo2]
        expect(todo_list.incomplete).to eq []
    end

    it "fails when trying to add empty string" do
        todo_list = TodoList.new
        todo = Todo.new("walk dogs")
        expect { todo_list.add("") }.to raise_error "There is no task to add."
    end

    it "return completed list including all todos after giving up" do
        todo_list = TodoList.new
        todo1 = Todo.new("walk dogs")
        todo2 = Todo.new("clean room")
        todo_list.add(todo1)
        todo_list.add(todo2)
        todo_list.give_up!
        expect(todo_list.complete).to eq [todo1, todo2]
    end
end