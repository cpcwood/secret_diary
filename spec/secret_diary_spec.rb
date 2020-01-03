require 'secret_diary'

describe SecretDiary do
  describe '#get_entries' do
    it 'is initialy locked' do
      expect{subject.get_entries}.to raise_error('Diary is locked!')
    end
    it 'entry recalled' do
      entry = 'test entry'
      subject.unlock
      subject.add_entries(entry)
      expect(subject.get_entries).to eq([entry])
    end
  end

  describe '#add_entries' do
    it 'is initialy locked' do
      expect{subject.add_entries('test')}.to raise_error('Diary is locked!')
    end
  end

  describe '#unlock' do
    it 'entry can be added after unlock' do
      subject.unlock
      expect(subject.add_entries('test')).to eq('Entry added!')
    end
  end

  describe '#lock' do
    it 'entry cannot be added after unlock then lock' do
      subject.unlock
      subject.lock
      expect{subject.add_entries('test')}.to raise_error('Diary is locked!')
    end
  end

end
