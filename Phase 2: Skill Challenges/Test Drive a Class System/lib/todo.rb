class Todo
    def initialize(task) # task is a string
      @task = task
      @done = []
    end
  
    def task
      return @task
    end
  
    def mark_done!
        @done << @task
    end
  
    def done?
        !@done.empty?
    end
end