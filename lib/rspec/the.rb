module RSpec::The
  def the(method, &block)
    describe(method.to_s) do
      let(:__the_subject) { self.public_send method }

      def is_expected
        expect(__the_subject)
      end
      alias_method :are_expected, :is_expected

      example(nil, &block)
    end
  end
end

RSpec.configure do |rspec|
  rspec.extend RSpec::The
end
