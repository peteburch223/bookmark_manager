require 'bookmark'

describe Bookmark do
  let(:datamapper_class) { double :DataMapper, new: datamapper, setup: nil, finalize: nil }
  let(:datamapper) { double :datamapper }
  subject(:bookmark) { described_class.new(datamapper_class: datamapper_class) }

  describe '#initialize' do
    it { expect(datamapper_class).to receive(:setup)}
  end
end
