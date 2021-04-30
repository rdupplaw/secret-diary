require 'secret_diary'

describe SecretDiary do
  describe '#lock' do
    diary = SecretDiary.new

    it 'returns "locked"' do
      expect(diary.lock).to eq('locked')
    end
  end

  describe '#unlock' do
    diary = SecretDiary.new

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

    context 'when diary is unlocked then locked again' do
      diary = SecretDiary.new
      diary.unlock
      diary.lock

      it 'throws an error' do
        expect { diary.add_entry('test') }.to raise_error(RuntimeError)
      end
    end
  end

  describe '#get_entries' do
    context 'when diary is locked' do
      let (:diary) {SecretDiary.new}

      it 'throws an error' do
        expect { diary.get_entries }.to raise_error(RuntimeError)
      end
    end

    context 'when diary is unlocked' do
      context 'when no entries have been added' do
        diary = SecretDiary.new
        diary.unlock

        it 'returns nil' do
          expect(diary.get_entries).to be_nil
        end
      end

      context 'when one entry has been added' do
        diary = SecretDiary.new
        diary.unlock
        diary.add_entry('test')

        it 'returns the entry' do
          expect(diary.get_entries).to eq('test')
        end
      end

      context 'when two entries have been added' do
        diary = SecretDiary.new
        diary.unlock
        diary.add_entry('test')
        diary.add_entry('test2')

        it 'returns an array of both entries' do
          expect(diary.get_entries).to eq(['test', 'test2'])
        end
      end
    end
  end
end
