Gem::Specification.new do |spec|
  spec.name          = "lita-octocat"
  spec.version       = "0.1.0"
  spec.authors       = ["Daniel Yoon", "Gabriel Mazetto"]
  spec.email         = ["robotright@gmail.com", "brodock@gmail.com"]
  spec.description   = %q{Display ascii octocat saying random things.}
  spec.summary       = %q{Display ascii octocat saying random things.}
  spec.homepage      = "https://github.com/daniely/lita-octocat"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.4"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.3.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
