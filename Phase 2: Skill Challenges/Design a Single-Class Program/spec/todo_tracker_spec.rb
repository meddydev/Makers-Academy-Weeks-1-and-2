# 1. Describe the Problem
# As a user
# So that I can keep track of my tasks
# I want a program that I can add todo tasks to and see a list of them.
# -
# As a user
# So that I can focus on tasks to complete
# I want to mark tasks as complete and have them disappear from the list.
# -
# 2. Design the Class Interface
# class Todo
#     def initialize
#         # ...
#     end

#     def add(task) # task is a string representing a task to be completed  
#         # adds task to list
#         # doesn't return anything
#         # fails for empty string
#     end

#     def list
#         # returns list of uncompleted tasks as an array (with no duplicates: unique)
#     end

#     def complete(task) # task is a string representing a task that has now been completed
#         # removes task from list
#         # doesn't return anything
#         # fails if task doesn't exist
#     end
# end
# -
# 3. Create Examples as Tests
# a)
# todo = Todo.new
# todo.list => []
# -
# b)
# todo = Todo.new
# todo.add("") => raise_error "Error: no task given to be added."
# -
# c)
# todo = Todo.new
# todo.add("Clean room.")
# todo.list => ["Clean room."]
# -
# d)
# todo = Todo.new
# todo.add("Clean room.")
# todo.add("Walk dogs.")
# todo.list => ["Clean room.", "Walk dogs."]
# -
# e)
# todo = Todo.new
# todo.add("Clean room.")
# todo.add("Walk dogs.")
# todo.complete("Clean room.")
# todo.list => ["Walk dogs."]
# -
# f)
# todo = Todo.new
# todo.add("Clean room.")
# todo.complete("Meditate for 30 minutes.") => raise_error "Error: this task has not been added to the todo list."
# -
# g) no duplicates
# todo = Todo.new
# todo.add("Clean room.")
# todo.add("Walk dogs.")
# todo.add("Clean room.")
# todo.list => ["Clean room.", "Walk dogs."]
# -
# h)
# todo = Todo.new
# todo.add("Clean room.")
# todo.complete("") => raise_error "Error: no task given to be marked as complete."

require "todo_tracker"

describe Todo do 
    context "when no tasks have been added" do
        it "returns empty array" do
            todo = Todo.new
            expect(todo.list).to eq []
        end
    end

    context "when trying to add an empty string" do
        it "raises appropriate error message" do
            todo = Todo.new
            expect { todo.add("") }.to raise_error "Error: no task given to be added."
        end
    end
    
    context "when one task is added" do
        it "lists that one task" do
            todo = Todo.new
            todo.add("Clean room.")
            expect(todo.list).to eq ["Clean room."]
        end
    end

    context "when more than one task is added" do
        it "lists all tasks" do
            todo = Todo.new
            todo.add("Clean room.")
            todo.add("Walk dogs.")
            todo.add("Wash dishes.")
            expect(todo.list).to eq ["Clean room.", "Walk dogs.", "Wash dishes."]
        end
    end

    context "when a task is completed" do
        it "lists tasks minus the completed one" do
            todo = Todo.new
            todo.add("Clean room.")
            todo.add("Walk dogs.")
            todo.complete("Clean room.")
            expect(todo.list).to eq ["Walk dogs."]
        end
    end

    context "when all tasks are completed" do
        it "lists empty array" do
            todo = Todo.new
            todo.add("Clean room.")
            todo.add("Walk dogs.")
            todo.complete("Clean room.")
            todo.complete("Walk dogs.")
            expect(todo.list).to eq []
        end
    end

    context "when trying to complete task that is yet to be added ot list" do
        it "raises appropriate error" do
            todo = Todo.new
            todo.add("Clean room.")
            expect { todo.complete("Meditate for 30 minutes.") }.to raise_error "Error: this task has not been added to the todo list."
        end
    end

    context "when duplicate tasks are added" do
        it "lists tasks without duplicates" do
            todo = Todo.new
            todo.add("Clean room.")
            todo.add("Walk dogs.")
            todo.add("Clean room.")
            expect(todo.list).to eq ["Clean room.", "Walk dogs."]
        end
    end

    context "for empty string passed through as a task to be completed" do
        it "raises appropriate error message" do
            todo = Todo.new
            todo.add("Clean room.")
            expect { todo.complete("") }.to raise_error "Error: no task given to be marked as complete."
        end
    end
end