require_relative "lib/futurism_nice_partials/version"

Gem::Specification.new do |spec|
  spec.name        = "futurism_nice_partials"
  spec.version     = FuturismNicePartials::VERSION
  spec.authors     = ["Julian Rubisch"]
  spec.email       = ["julian@julianrubisch.at"]
  spec.homepage    = "https://github.com/julianrubisch/futurism_nice_partials"
  spec.summary     = "Shim to integrate Futurism with NicePartials"
  spec.description = "Shim to integrate Futurism with NicePartials"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/julianrubisch/futurism_nice_partials"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "actionview", ">= 4.2.6"
  spec.add_dependency "futurism", "1.2.0.pre4"
  spec.add_dependency "nice_partials"

  spec.add_development_dependency "standard"
end
