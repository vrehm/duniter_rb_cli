
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "duniter_rb_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "duniter_rb_cli"
  spec.license       = "GPL-3.0"
  spec.version       = DuniterRbCli::VERSION
  spec.authors       = ["Vincent REHM"]
  spec.email         = ["vincentrehm@protonmail.com"]

  spec.summary       = %q{Lightweight CLI in Ruby manipulating Duniter's BMA API.}
  spec.description   = %q{Manipulate easily BMA endpoints in Duniter's nodes.}
  spec.homepage      = "https://github.com/vrehm/duniter-rb-cli"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/duniter_rb_cli/extconf.rb"]

  spec.add_dependency "thor", "~> 0.20.0"
  spec.add_dependency "tty-command", "~> 0.8.0"
  spec.add_dependency "tty-config", "~> 0.3.0"
  spec.add_dependency "tty-prompt", "~> 0.18.0"
  spec.add_dependency "tty-tree", "~> 0.2.0"
  # spec.add_dependency "tty-box", "~> 0.3.0"
  # spec.add_dependency "tty-color", "~> 0.4"
  # spec.add_dependency "tty-cursor", "~> 0.6"
  # spec.add_dependency "tty-editor", "~> 0.5.0"
  # spec.add_dependency "tty-file", "~> 0.7.0"
  # spec.add_dependency "tty-font", "~> 0.2.0"
  # spec.add_dependency "tty-markdown", "~> 0.5.0"
  # spec.add_dependency "tty-pager", "~> 0.12.0"
  # spec.add_dependency "tty-pie", "~> 0.1.0"
  # spec.add_dependency "tty-platform", "~> 0.2.0"
  # spec.add_dependency "tty-progressbar", "~> 0.16.0"
  # spec.add_dependency "tty-screen", "~> 0.6"
  # spec.add_dependency "tty-spinner", "~> 0.9.0"
  # spec.add_dependency "tty-table", "~> 0.10.0"
  # spec.add_dependency "tty-which", "~> 0.4"
  # spec.add_dependency "pastel", "~> 0.7.2"
  spec.add_dependency "httparty", "~> 0.13.7"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug", "~> 3.6"
end
