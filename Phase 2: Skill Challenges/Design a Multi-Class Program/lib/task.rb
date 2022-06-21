class Task
    def initialize(task) # task is some string
        @task = task
        @done = false
    end

    def task
        @task
    end

    def mark_done!
        @done = true
    end

    def done?
        @done
    end
end