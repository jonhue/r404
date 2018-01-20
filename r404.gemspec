# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'r404', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'r404'
    gem.version               = R404::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'Error handler & renderer for Rails'
    gem.description           = 'Error handler & renderer for Rails'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'me@jonhue.me'
    gem.homepage              = 'https://github.com/jonhue/r404'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'app/**/*']
    gem.require_paths         = ['lib']

    gem.post_install_message  = IO.read('INSTALL.md')

    gem.required_ruby_version = '>= 2.3'

    gem.add_dependency 'railties', '>= 5.0'
    gem.add_dependency 'activesupport', '>= 5.0'
    gem.add_dependency 'actionpack', '>= 5.0'

    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
