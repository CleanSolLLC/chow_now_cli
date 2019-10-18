lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "chow_now_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "chow_now_cli"
  spec.version       = ChowNowCli::VERSION
  spec.authors       = ["CleanSolLLC"]
  spec.email         = ["mamark90@gmail.com"]

  #must input summary
  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-nav'
  
  spec.add_dependency 'require_all'
  spec.add_dependency 'io-console'
  spec.add_dependency 'text-table', '~> 1.2', '>= 1.2.4'
  spec.add_dependency 'nokogiri'
end
