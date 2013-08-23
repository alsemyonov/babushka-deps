# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

meta :rbenv do
  accepts_value_for :source
  accepts_value_for :path

  def rbenv_path
    File.expand_path('~/.rbenv')
  end

  def rbenv_plugin_path(name)
    File.join(rbenv_path, 'plugins', name)
  end

  def rbenv_ruby_path(version)
    File.join(rbenv_path, 'versions', version, 'bin', 'ruby')
  end

  template do
    requires 'git.bin'

    met? { File.directory?(path) }
    meet { git(source, to: path) }
  end
end

dep 'rbenv installed.rbenv' do
  source('https://github.com/sstephenson/rbenv.git')
  path(rbenv_path)
end

dep 'ruby-build installed.rbenv' do
  source('https://github.com/sstephenson/ruby-build.git')
  path(rbenv_plugin_path('ruby-build'))
end

dep 'rbenv-gem-rehash installed.rbenv' do
  source('https://github.com/sstephenson/rbenv-gem-rehash.git')
  path(rbenv_plugin_path('rbenv-gem-rehash'))
end

dep 'rbenv-readline installed.rbenv' do
  source('https://github.com/tpope/rbenv-readline.git')
  path(rbenv_plugin_path('rbenv-readline'))
end

dep 'rbenv-update installed.rbenv' do
  source('https://github.com/rkh/rbenv-update.git')
  path(rbenv_plugin_path('rbenv-update'))
end

dep 'rbenv PATH.append', :profile do
  file profile
  line 'export PATH="$HOME/.rbenv/bin:$PATH"'
end

dep 'rbenv init.append', :profile do
  file profile
  line 'eval "$(rbenv init -)"'
end

dep 'ruby.rbenv', :version do
  requires 'rbenv'

  version.default!('2.0.0-p247')

  met? { File.executable?(rbenv_ruby_path(version)) }
  meet { shell("rbenv install #{version}") }
end

dep 'rbenv', :profile do
  on(:linux) { profile.default!('~/.profile') }
  on(:osx) { profile.default!('~/.bash_profile') }

  requires 'rbenv installed.rbenv'
  requires 'ruby-build installed.rbenv'
  requires 'rbenv-gem-rehash installed.rbenv'
  requires 'rbenv-update installed.rbenv'
  on(:osx) { requires 'rbenv-readline installed.rbenv' }
  requires 'rbenv PATH.append'.with(profile)
  requires 'rbenv init.append'.with(profile)
end
