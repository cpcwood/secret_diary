class SecretDiary
  def initialize
    @lock_status = true
    @entries = []
  end

  def get_entries
    raise 'Diary is locked!' if @lock_status
    @entries
  end

  def add_entries(entry)
    raise 'Diary is locked!' if @lock_status
    @entries << entry
    'Entry added!'
  end

  def unlock
    @lock_status = false
  end

  def lock
    @lock_status = true
  end
end
