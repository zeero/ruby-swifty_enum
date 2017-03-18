# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swifty_enum/version'

Gem::Specification.new do |spec|
  spec.name          = "swifty_enum"
  spec.version       = SwiftyEnum::VERSION
  spec.authors       = ["zeero"]
  spec.email         = ["zeero26@gmail.com"]

  spec.summary       = %q{Enum for Ruby with Swift style.}
  spec.description   = %q{SwiftyEnum enable defining enums in Ruby. Enums behave like Swift enums.}
  spec.homepage      = "https://github.com/zeero/ruby-swifty_enum"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.1.10'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-doc_reporter"
  spec.add_development_dependency "minitest-stub_any_instance"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "guard-yard"
  spec.add_development_dependency "rb-fsevent"
  spec.add_development_dependency "terminal-notifier-guard", "~> 1.6.1"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 1.0.0"
end
