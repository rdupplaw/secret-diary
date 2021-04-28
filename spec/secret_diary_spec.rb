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
end
