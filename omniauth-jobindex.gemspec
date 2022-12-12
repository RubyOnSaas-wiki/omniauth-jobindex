# frozen_string_literal: true

require File.expand_path(
  File.join('..', 'lib', 'omniauth', 'jobindex', 'version'),
  __FILE__
)

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-jobindex'
  spec.version       = OmniAuth::Jobindex::VERSION
  spec.authors       = ['Maciej Litwiniuk']
  spec.email         = ['maciej@litwiniuk.net']

  spec.summary       = 'Omniauth Jobindex.dk Strategy'
  spec.homepage      = 'https://github.com/RubyOnSaas-wiki/omniauth-jobindex'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth', '>= 1.1.1'
  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.5'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '= 0.54'
end
