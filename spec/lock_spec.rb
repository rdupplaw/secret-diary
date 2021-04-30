require 'lock'
describe Lock do
  describe '#lock' do
    it 'locks the lock' do
      lock = Lock.new
      lock.unlock
      lock.lock

      expect(lock.locked?).to eq(true)
    end
  end

  describe '#unlock' do
    it 'unlocks the lock' do
      lock = Lock.new
      lock.unlock

      expect(lock.locked?).to eq(false)
    end
  end

  describe '#locked?' do
    context 'when lock is locked' do
      it 'returns true' do
        lock = Lock.new
        lock.lock

        expect(lock.locked?).to eq(true)
      end
    end
    
    context 'when lock is unlocked' do
      it 'returns false' do
        lock = Lock.new
        lock.unlock

        expect(lock.locked?).to eq(false)
      end
    end
  end
end
