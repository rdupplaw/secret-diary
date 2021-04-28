require 'secret_diary'

describe SecretDiary do
  context 'instance' do
    it 'responds to #lock' do
      expect(SecretDiary.new()).to respond_to(:lock)
    end
    it 'responds to #unlock' do
      expect(SecretDiary.new()).to respond_to(:unlock)
    end
    it 'responds to #add_entry' do
      expect(SecretDiary.new()).to respond_to(:add_entry)
    end
    it 'responds to #get_entries' do
      expect(SecretDiary.new()).to respond_to(:get_entries)
    end
  end

  describe '#lock' do
    let (:diary) {SecretDiary.new}

    it 'returns "locked"' do
      expect(diary.lock).to eq('locked')
    end
  end

  describe '#unlock' do
    let (:diary) {SecretDiary.new}

    it 'returns "unlocked"' do
      expect(diary.unlock).to eq('unlocked')
    end
  end

  describe '#add_entry' do
    context 'when diary is locked' do
      let (:diary) {SecretDiary.new}

      it 'throws an error' do
        expect { diary.add_entry('test') }.to raise_error(RuntimeError)
      end
    end

    context 'when diary is unlocked' do
      let (:diary) { SecretDiary.new }
      before { diary.unlock }

      it 'returns "entry added to diary"' do
        expect(diary.add_entry('test')).to eq('entry added to diary')
      end
    end
  end
end
