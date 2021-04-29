class SecretDiary
  attr_reader :locked
  def initialize
    @locked = true
    @entries = []
  end

  def lock
    @locked = true
    'locked'
  end

  def unlock
    @locked = false
    'unlocked'
  end

  def add_entry(text)
    raise 'Secret Diary is locked' if locked
    @entries << text
    'entry added to diary'
  end

  def get_entries
    raise 'Secret Diary is locked' if locked
    @entries.length > 1 ? @entries : @entries[0]
  end
end

