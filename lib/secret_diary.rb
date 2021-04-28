class SecretDiary
  attr_accessor :locked
  def initialize
    @locked = true
  end

  def lock
    'locked'
  end

  def unlock
    'unlocked'
  end

  def add_entry(text)
    raise 'Secret Diary is locked' if locked
  end

  def get_entries
  end
end
