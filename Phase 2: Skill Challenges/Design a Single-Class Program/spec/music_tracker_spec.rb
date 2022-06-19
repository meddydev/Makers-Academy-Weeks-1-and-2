# 1. Describe the Problem
# As a user
# So that I can keep track of my music listening
# I want to add tracks I've listened to and see a list of them.
# -
# 2. Design the Class Interface
# class TracksListenedTo
#     def initialize
#         # ...
#     end

#     def add(song) # song represents a string that should be added to list of tracks listened to
#         # returns nothing
#         # adds song to list of tracks listened to
#         # fails for empty string

#     def list
#         # return unique list of tracks listened to (or empty list if nothing has been added)
#     end
# end
# -
# 3. Create Examples as Tests
# -
# a)
# track_list = TracksListenedTo.new
# track_list.list => []
# -
# b)
# track_list = TracksListenedTo.new
# track_list.add("Starlight")
# track_list.list => ["Starlight"]
# -
# c)
# track_list = TracksListenedTo.new
# track_list.add("Starlight")
# track_list.add("Six paths")
# track_list.add("100Ms")
# track_list.list => ["Starlight", "Six paths", "100Ms" ]
# -
# d)
# track_list = TracksListenedTo.new
# track_list.add("Starlight")
# track_list.add("Starlight")
# track_list.add("Six paths")
# track_list.list => ["Starlight", "Six Paths"]
# -
# e)
# track_list = TracksListenedTo.new
# track_list.add("") => fails "No song given to be added to list."

require "music_tracker"

describe TracksListenedTo do
    context "when no tracks have been added" do
        it "returns an empty list" do
            track_list = TracksListenedTo.new
            expect(track_list.list).to eq []
        end
    end

    context "when one track is added" do
        it "returns the track as a one item list " do
            track_list = TracksListenedTo.new
            track_list.add("Starlight")
            expect(track_list.list).to eq ["Starlight"]
        end
    end

    context "when multiple (3) unique tracks are added" do
        it "returns all tracks as a list" do
            track_list = TracksListenedTo.new
            track_list.add("Starlight")
            track_list.add("Six paths")
            track_list.add("100Ms")
            expect(track_list.list).to eq ["Starlight", "Six paths", "100Ms"]
        end
    end

    context "when a track is added multiple times" do
        it "returns a unique list of tracks (i.e. doesn't include any track more than once)" do
            track_list = TracksListenedTo.new
            track_list.add("Starlight")
            track_list.add("Starlight")
            track_list.add("Six Paths")
            expect(track_list.list).to eq ["Starlight", "Six Paths"]
        end
    end

    context "when attempting to add empty string" do
        it "raises error disallowing the addition of the empty string" do
            track_list = TracksListenedTo.new
            expect { track_list.add("") }.to raise_error "No song given to be added to the list."
        end
    end
end