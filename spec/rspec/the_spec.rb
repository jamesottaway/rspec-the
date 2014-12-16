require 'rspec/the'
require 'spec_helper'

describe RSpec::The do
  describe '#the' do
    context 'basic usage' do
      let(:counter) { Counter.new }
      before { expect(counter.next).to eq 1 }
      let(:next) { counter.next }
      the(:next) { is_expected.to eq 2 }
      after { expect(counter.next).to eq 3 }
    end

    context '#are_expected' do
      let(:counter) { Counter.new }
      before { expect(counter.next).to eq 1 }
      let(:nexts) { 5.times.inject [] { |acc| acc << counter.next } }
      the(:nexts) { are_expected.to eq [2, 3, 4, 5, 6] }
      after { expect(counter.next).to eq 7 }
    end
  end
end
