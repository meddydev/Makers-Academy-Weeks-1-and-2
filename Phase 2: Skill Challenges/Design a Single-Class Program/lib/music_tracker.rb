class TracksListenedTo
    def initialize
        @tracks = []
    end

    def add(track)
        fail "No song given to be added to the list." if track == ""
        @tracks.push(track) unless @tracks.include?(track) == true
    end

    def list
        @tracks
    end
end