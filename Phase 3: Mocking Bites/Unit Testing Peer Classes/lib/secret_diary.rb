class SecretDiary
    def initialize(diary) # diary is an instance of Diary
      @locked = true
      @diary = diary
    end
  
    def read
      fail "Go away!" if @locked
      @diary.read
    end
  
    def lock
        @locked = true
    end
  
    def unlock
        @locked = false
    end

    def locked?
        @locked
    end
end