require "diary"
require "diary_entry"
require "task_list"
require "task"

describe "life_planner" do
    describe Diary do
        context "after adding multiple diary entries (no phone numbers included)" do
            it "returns list of all entries" do
                diary = Diary.new
                entry0 = DiaryEntry.new("21 Jun", "having fun today")
                entry1 = DiaryEntry.new("21 Jun", "played football")
                diary.add(entry0)
                diary.add(entry1)
                expect(diary.list).to eq [entry0, entry1]
            end

            it "returns empty list when searching for phone numbers" do
                diary = Diary.new
                entry0 = DiaryEntry.new("21 Jun", "having fun today")
                entry1 = DiaryEntry.new("21 Jun", "played football")
                diary.add(entry0)
                diary.add(entry1)
                expect(diary.search_for_phone_numbers).to eq []
            end

            it "returns best entry to read given time available (when there exists an entry that can be read in the time)" do
                diary = Diary.new
                entry0 = DiaryEntry.new("21 Jun", "played football")
                entry1 = DiaryEntry.new("21 Jun", "having fun today")
                entry2 = DiaryEntry.new("21 Jun", "looking forward to restaurant")
                entry3 = DiaryEntry.new("21 Jun", "I am proud of myself!")
                diary.add(entry0)
                diary.add(entry1)
                diary.add(entry2)
                diary.add(entry3)
                expect(diary.select_most_readable_entry(1,4)).to eq entry2
            end

            it "returns nil when no entries are readable" do
                diary = Diary.new
                entry0 = DiaryEntry.new("21 Jun", "played football")
                entry1 = DiaryEntry.new("21 Jun", "having fun today")
                diary.add(entry0)
                diary.add(entry1)
                expect(diary.select_most_readable_entry(1,1)).to eq nil
            end
        end
        context "after adding multiple diary entries that include phone numbers" do
            it "returns correct list of phone numbers" do
                diary = Diary.new
                entry0 = DiaryEntry.new("21 Jun", "having fun today 07528783900")
                entry1 = DiaryEntry.new("21 Jun", "played football 07428783939")
                diary.add(entry0)
                diary.add(entry1)
                expect(diary.search_for_phone_numbers).to eq ["07528783900", "07428783939"] 
            end             
        end
    end

    describe TaskList do
        context "when multiple tasks added and none are marked done" do
            it "returns both items in the incomplete list (and returns empty completed list)" do
                task_list = TaskList.new
                task0 = Task.new("walk the dogs")
                task1 = Task.new("wash dishes")
                task_list.add(task0)
                task_list.add(task1)
                expect(task_list.incompleted).to eq [task0, task1]
                expect(task_list.completed).to eq []
            end
        end

        context "when 2 tasks are added and only one is marked as done" do
            it "returns correct incomplete and completed lists" do
                task_list = TaskList.new
                task0 = Task.new("walk the dogs")
                task1 = Task.new("wash dishes")
                task_list.add(task0)
                task_list.add(task1)
                task0.mark_done!
                expect(task_list.incompleted).to eq [task1]
                expect(task_list.completed).to eq [task0]
            end
        end 
    end
end