lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "env_detective/version"

Gem::Specification.new do |spec|
  spec.name          = "env_detective"
  spec.version       = EnvDetective::VERSION
  spec.authors       = ["grezar"]
  spec.email         = ["grezar.dev@gmail.com"]

  spec.summary       = %q{Detect environment variables being referred.}
  spec.homepage      = "https://github.com/grezar/env_detective"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/grezar/env_detective"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
