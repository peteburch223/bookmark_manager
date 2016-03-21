require 'bookmark'

describe Bookmark do
  let(:datamapper_class) { double :DataMapper, setup: nil, finalize: finalize }
  let(:finalize) { double :finalize, auto_upgrade!: nil}
  # let(:datamapper) { double :datamapper }
  subject(:bookmark) { described_class.new(datamapper_class: datamapper_class) }
  let(:bookmark_class) { described_class }

  describe '#initialize' do
    it 'sets up DataMapper' do
      expect(datamapper_class).to receive(:setup)
      bookmark_class.new(datamapper_class: datamapper_class)
    end
    it 'finalizes DataMapper setup' do
      expect(finalize).to receive(:auto_upgrade!)
      bookmark_class.new(datamapper_class: datamapper_class)
    end
  end
end
