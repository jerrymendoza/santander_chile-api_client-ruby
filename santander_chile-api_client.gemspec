require_relative 'lib/santander_chile/api_client/version'

Gem::Specification.new do |spec|
  spec.name          = "santander_chile-api_client"
  spec.version       = SantanderChile::ApiClient::VERSION
  spec.authors       = ["Jerry Mendoza"]
  spec.email         = ["jamendoza@uc.cl"]

  spec.summary       = %q{Unofficial Client for Santander Bank Chile API.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/jerrymendoza/santander_chile-api_client-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jerrymendoza/santander_chile-api_client-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/jerrymendoza/santander_chile-api_client-ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.7"
  spec.add_dependency "faraday_middleware", "~> 1.1"
end
