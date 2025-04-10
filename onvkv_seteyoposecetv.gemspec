# frozen_string_literal: true

require_relative "lib/onvkv_seteyoposecetv/version"

Gem::Specification.new do |spec|
  spec.name = "onvkv_seteyoposecetv"
  spec.version = OnvkvSeteyoposecetv::VERSION
  spec.authors = ["Tad Hosford"]
  spec.email = ["tad.hosford@gmail.com"]

  spec.summary                       = "Extracting conjugator library code from https://www.nokose-oklane.com"
  spec.description                   = "Just relocating some code to make it sharable"
  spec.homepage                      = "https://github.com/rthbound/onvkv_seteyoposecetv"
  spec.license                       = "MIT"
  spec.required_ruby_version         = ">= 2.6.0"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["source_code_uri"]   = "https://github.com/rthbound/onvkv_seteyoposecetv"
  spec.metadata["changelog_uri"]     = "https://github.com/rthbound/onvkv_seteyoposecetv/blob/main/CHANGELOG.md"
  spec.metadata["homepage_uri"]      = "https://github.com/rthbound/onvkv_seteyoposecetv"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
