class Todo
    def initialize
        @todo_list = []
    end

    def add(task)
        fail "Error: no task given to be added." if task == ""
        @todo_list.push(task)
    end

    def list
        @todo_list.uniq
    end

    def complete(task)
        fail "Error: no task given to be marked as complete." if task == ""
        fail "Error: this task has not been added to the todo list." if @todo_list.include?(task) == false
        @todo_list.delete(task)
    end
end