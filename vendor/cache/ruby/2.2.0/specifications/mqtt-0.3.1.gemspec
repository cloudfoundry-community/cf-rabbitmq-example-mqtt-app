# -*- encoding: utf-8 -*-
# stub: mqtt 0.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "mqtt"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nicholas J Humfrey"]
  s.date = "2014-10-10"
  s.description = "Pure Ruby gem that implements the MQTT protocol, a lightweight protocol for publish/subscribe messaging."
  s.email = "njh@aelius.com"
  s.homepage = "http://github.com/njh/ruby-mqtt"
  s.licenses = ["MIT"]
  s.rubyforge_project = "mqtt"
  s.rubygems_version = "2.4.8"
  s.summary = "Implementation of the MQTT protocol"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.5.0"])
      s.add_development_dependency(%q<rake>, [">= 0.10.0"])
      s.add_development_dependency(%q<yard>, [">= 0.8.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, [">= 1.5.0"])
      s.add_dependency(%q<rake>, [">= 0.10.0"])
      s.add_dependency(%q<yard>, [">= 0.8.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.5.0"])
    s.add_dependency(%q<rake>, [">= 0.10.0"])
    s.add_dependency(%q<yard>, [">= 0.8.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
