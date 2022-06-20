class TodoList
    def initialize
      @todos = []
    end
  
    def add(todo)
        fail "There is no task to add." if todo == ""
        @todos << todo
    end
  
    def incomplete
        return @todos.select {|todo| todo.done? == false}
    end
  
    def complete
        return @todos.select {|todo| todo.done? == true}
    end
  
    def give_up!
      @todos.each do |todo|
        todo.mark_done!
      end
    end
end