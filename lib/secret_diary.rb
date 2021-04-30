require_relative 'lock'

class SecretDiary
  def initialize
    @lock = Lock.new
    @entries = []
  end

  def lock
    @lock.lock
    'locked'
  end

  def unlock
    @lock.unlock
    'unlocked'
  end

  def add_entry(text)
    raise 'Secret Diary is locked' if @lock.locked?
    @entries << text
    'entry added to diary'
  end

  def get_entries
    raise 'Secret Diary is locked' if @lock.locked?
    @entries.length > 1 ? @entries : @entries[0]
  end
end

