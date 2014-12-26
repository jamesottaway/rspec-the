# RSpec::The

Easily make assertions about the contents of your `let` blocks

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-the'
```

And then execute:

```
bundle install
```

Or install it yourself as:

```
gem install rspec-the
```

## Usage

Using `rspec-its` to test your given `subject` works for simple method invocations, but requires excessive nesting in more complex scenarios.

``` ruby
describe Array do
  let(:array) { [1, 2, 3, 4, 5] }
  subject { array }

  its(:count) { is_expected.to eq 5 }
  its(:first) { is_expected.to eq 1 }

  describe 'select #even?' do
    subject { array.select(&:even?) }
    it { is_expected.to eq [2, 4] }
  end

  describe 'select #odd?' do
    subject { array.select(&:odd?) }
    it { is_expected.to eq [1, 3, 5] }
  end
end
```

Instead, `rspec-the` allows us use `let` to define many pseudo-`subject` blocks which can easily be tested.

``` ruby
describe Array do
  subject { [1, 2, 3, 4, 5] }

  its(:count) { is_expected.to eq 5 }
  its(:first) { is_expected.to eq 1 }

  let(:evens) { subject.select(&:even?) }
  the(:evens) { is_expected.to eq [2, 4] }

  let(:odds) { subject.select(&:odd?) }
  the(:odds) { is_expected.to eq [1, 3, 5] }
end
```

See, isn't that easier?!?

## Contributing

1. Fork it ( https://github.com/jamesottaway/rspec-the/fork )
2. Create your feature branch (`git checkout -b $BRANCH_NAME`)
3. Commit your changes (`git commit --all --message $COMMIT_MESSAGE`)
4. Push to the branch (`git push $REMOTE $BRANCH_NAME`)
5. Create a new Pull Request ( https://github.com/jamesottaway/rspec-the/compare )
