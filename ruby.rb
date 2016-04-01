# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

## Ruby

dep 'common ruby', :version do
  version.default!(File.read(File.expand_path('../.ruby-version', __FILE__)).chomp)

  requires 'ruby.rbenv'.with(version)

  requires 'bundler.gem'
  requires 'gem-browse.gem'

  requires 'foreman.gem'
end

dep 'production ruby', :version do
  requires 'common ruby'.with(version)
end

dep 'development ruby', :version do
  requires 'common ruby'.with(version)
  requires 'ruby global.rbenv'.with(version)

  requires 'gem-ctags.gem'

  requires 'thor.gem'
  requires 'yard.gem'
  requires 'pry.gem'

  requires 'rails.gem'

  requires 'html2slim.gem'
  requires 'overcommit.gem'
end

dep 'test ruby', :version do
  requires 'common ruby'.with(version)

  requires 'rubocop.gem'
  requires 'brakeman.gem'
  requires 'bundler-audit.gem'
end

## Interpreter

dep 'ruby.rbenv', :version do
  requires 'rbenv'
  requires_when_unmet %w(curl.lib ffi.lib openssl.lib readline.lib yaml.lib zlib.lib)

  met? { rbenv_ruby_path(version).executable? }
  meet { shell("rbenv install #{version}") }
end

dep 'ruby global.rbenv', :version do
  requires 'ruby.rbenv'.with(version)
  version.default!(File.read(File.expand_path('../.ruby-version', __FILE__)).chomp)

  met? { (rbenv_path / 'version').grep version }
  meet { shell("rbenv global #{version}") }
end

## Gems

# http://bundler.io/
# The best way to manage a Ruby application's gems
dep('bundler.gem') { provides 'bundle' }
dep('rubygems-bundler.gem') { provides 'rubygems-bundler-uninstaller' }

# `gem` command extensions
dep('gem-browse.gem') { provides nil }
dep('gem-ctags.gem') do
  requires 'ctags.bin'
  provides nil
end

# http://ddollar.github.io/foreman/
# manage Procfile-based applications
dep('foreman.gem') { provides 'foreman' }

# http://whatisthor.com/
# Thor is a toolkit for building powerful command-line interfaces.
dep('thor.gem') { provides 'thor' }

# http://yardoc.org/
# Yay! A Ruby Documentation Tool
dep('yard.gem') { provides 'yard', 'yardoc' }


dep('pry.gem') { provides 'pry' }
dep('html2slim.gem') { provides 'html2slim', 'erb2slim' }

dep('overcommit.gem') { provides 'overcommit' }
dep('rubocop.gem') { provides 'rubocop' }
dep('brakeman.gem') { provides 'brakeman' }
dep('bundler-audit.gem') { provides 'bundle-audit' }

dep('rails.gem') { provides 'rails' }
