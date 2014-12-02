# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'rspec-the'
  spec.version       = '0.0.1'
  spec.authors       = ['James Ottaway']
  spec.email         = ['hello@james.ottaway.io']
  spec.summary       = 'Easily make assertions about the contents of your `let` blocks'
  spec.homepage      = 'https://github.com/jamesottaway/rspec-the'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rspec-core', '>= 3.0.0'
  spec.add_runtime_dependency 'rspec-expectations', '>= 3.0.0'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
