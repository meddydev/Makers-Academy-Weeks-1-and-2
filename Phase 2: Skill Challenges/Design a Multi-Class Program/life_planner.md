1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

2. Design the Class System

There will be a diary containing multiple diary entries.
You'll need to be able to create (initialize) single diary entries.
You'll need to be able to search through diary for phone numbers.
You'll need to select appropriate entry to read based on time available

There will be a todo list containing multiple tasks.
You'll need to be able to create (initialize) tasks to do.

  ┌───────────────────────────────────────────────────────────────────┐
  │ Diary                                                             │
  │                                                                   │
  │ add (diary entries)                                               │
  │                                                                   │
  │ list (all added diary entries)                                    │
  │                                                                   │
  │ search_for_phone_number (looks through all diary entries for no.) │
  │                                                                   │
  └─select_most_readable_entry┼(looks┼through┼entreis┼for┼best┼one)───┘

 ┌─────────────────────────────────────┐
 │ DiaryEntry                          │
 │                                     │
 │ create an entry (i.e. initialize)   │
 │                                     │
 │ see name of entry (title)           │
 │                                     │
 │ see contents of entry (contents)    │
 │                                     │
 ├─────────────────────────┬─────┬─────┤
┌┴─────────────────────────┤     │┼────┴─────────────────┐
│Task                      │     ││TaskList              │
│                          │     ││                      │
│create a task (initialize)│     ││add (task items)      │
│                          │     ││                      │
│mark a task as done       │     ││list uncompleted tasks│
└──────────────────────────┘     ││                      │
                                 ││list completed tasks  │
                                 └┴──────────────────────┘
class Diary
    def initialize
    end

    def add(diary_entry) # diary_entry is object of DiaryEntry class
        # doesn't return anything
    end

    def list
        # returns list of all added diary entries
    end

    def search_for_phone_numbers
        # returns a unique list of all phone numbers present within all diary entries
    end

    def select_most_readable_entry(wpm, minutes) # wpm and minutes are integers
        # returns entry which contains the most words the user could possibly read given their wpm and minutes available
    end
end

class DiaryEntry
    def initialize(date, contents) # date and contents are strings
        @date = date
        @contents = contents
    end

    def contents
        # returns entry contents
    end

    def date
        # returns date as string
    end

    def word_count
        # returns number of word in entry contents
    end
end

class Task
    def initialize(task) # task is some string
        @task = task
    end

    def task
        # returns task as string
    end

    def mark_done!
        # doesn't return anything
    end

    def done?
        # returns true if done, false if not marked as done
    end
end

class TaskList
    def initialize
    end

    def add(task) # task is object of Task class
        # doesn't return anything
    end

    def incompleted
        # returns a list of tasks yet to be done
    end

    def completed
        # return a list of tasks marked as done
    end
end

3. Create Examples as Integration Tests

Diary
a)
diary = Diary.new
entry0 = DiaryEntry.new("21 Jun", "having fun today")
entry1 = DiaryEntry.new("21 Jun", "played football")
diary.add(entry0)
diary.add(entry1)
expect(diary.list).to eq [entry0, entry1]

b)
diary = Diary.new
entry0 = DiaryEntry.new("21 Jun", "having fun today 07528783900")
entry1 = DiaryEntry.new("21 Jun", "played football 07428783939")
diary.add(entry0)
diary.add(entry1)
expect(diary.search_for_phone_numbers).to eq ["07528783900", "07428783939"]

c)
diary = Diary.new
entry0 = DiaryEntry.new("21 Jun", "having fun today")
entry1 = DiaryEntry.new("21 Jun", "played football")
diary.add(entry0)
diary.add(entry1)
expect(diary.search_for_phone_numbers).to eq []

d)
diary = Diary.new
entry0 = DiaryEntry.new("21 Jun", "played football")
entry1 = DiaryEntry.new("21 Jun", "having fun today")
entry2 = DiaryEntry.new("21 Jun", "looking forward to restaurant")
entry3 = DiaryEntry.new("21 Jun", "I am proud of myself!")
diary.add(entry0)
diary.add(entry1)
diary.add(entry2)
diary.add(entry3)
expect(diary.select_most_readable_entry(1,4)) # => entry2

e)
diary = Diary.new
entry0 = DiaryEntry.new("21 Jun", "played football")
entry1 = DiaryEntry.new("21 Jun", "having fun today")
diary.add(entry0)
diary.add(entry1)
expect(diary.select_most_readable_entry(1,1)) # => nil

Task
f)
task_list = TaskList.new
task0 = Task.new("walk the dogs")
task1 = Task.new("wash dishes")
task_list.add(task0)
task_list.add(task1)
expect(task_list.incompleted) # => [task0, task1]
expect(task_list.completed) # => []

g)
task_list = TaskList.new
task0 = Task.new("walk the dogs")
task1 = Task.new("wash dishes")
task_list.add(task0)
task_list.add(task1)
task0.mark_done!
expect(task_list.incompleted) # => [task1]
expect(task_list.completed) # => [task0]

4. Create Examples as Unit Tests

Diary

a) //test written
diary = Diary.new
expect(diary.list) # => []

b)
diary = Diary.new // test written
expect(diary.search_for_phone_numbers) # => []

c)
diary = Diary.new // test written
expect(diary.select_most_readable_entry(wpm, minutes)) # => nil

DiaryEntry

a) //test written
entry0 = DiaryEntry.new("21 Jun", "Rather sunny out today!")
expect(entry0.contents) # => "Rather sunny out today!"

b) // test written
entry0 = DiaryEntry.new("21 Jun", "Rather sunny out today!")
expect(entry0.date) # => "21 Jun"

c) // test written
entry0 = DiaryEntry.new("21 Jun", "Rather sunny out today!")
expect(entry0.word_count) # => 4

d) // test written
entry0 = DiaryEntry.new("21 Jun", "")
expect(entry0.word_count) # => 0

TaskList

a) // test written
task_list = TaskList.new
expect(task_list.incompleted) # => []
expect(task_list.completed) # => []

Task

a) // test writeen
task0 = Task.new("record video of myself")
expect(task0.task) # => "record video of myself"

b) // test written
task0 = Task.new("record video of myself")
task1 = Task.new("wash dishes")
task0.mark_done!
expect(task0.done?) # => true
expect(task1.done?) # => false