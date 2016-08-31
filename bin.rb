# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

## Binaries

dep 'nginx.bin' do
  on(:linux) { installs 'nginx-full' }
end
dep 'postgresql.bin' do
  provides 'pg_config', 'psql'
end
dep 'mysql.bin' do
  provides 'mysqld', 'mysql'
  on(:linux) { installs 'mysql-server' }
end
dep 'rabbitmq.bin' do
  provides 'rabbitmqctl', 'rabbitmq-server'
  on(:linux) { installs 'rabbitmq-server' }
end
dep 'ejabberd.bin' do
  provides 'ejabberdctl'
end
dep 'redis.bin' do
  provides 'redis-cli', 'redis-server'
  on(:linux) { installs 'redis-server' }
end
dep 'mongodb.bin' do
  provides 'mongod', 'mongo'
  on(:linux) do
    requires 'apt source'.with(
      uri: 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart',
      uri_matcher: Regexp.escape('http://downloads-distro.mongodb.org/repo/ubuntu-upstart'),
      release: 'dist',
      repo: '10gen',
      should_update: 'yes'
    )
    installs 'mongodb-10gen'
  end
end
dep 'ctags.bin'
dep 'node.bin'

## Libraries

dep 'curl.lib' do
  installs {
    on :osx, [] # It's provided by the system.
    on :apt, 'libcurl4-openssl-dev'
    otherwise 'curl'
  }
end
dep 'ffi.lib' do
  installs {
    on :apt, 'libffi-dev'
    otherwise 'libffi'
  }
end
dep 'openssl.lib' do
  installs {
    via :apt, 'libssl-dev'
    via :yum, 'openssl-devel'
    otherwise 'openssl'
  }
end
dep 'openssl' do
  requires 'openssl.lib'
  requires 'openssl bundle config.task'
end
dep 'openssl bundle config.task' do
  requires 'bundler.gem'
  task { run 'bundle config build.eventmachine --with-cppflags=-I$(brew --prefix openssl)/include' }
end
dep 'readline.lib' do
  installs {
    on :lenny, 'libreadline5-dev'
    via :apt, 'libreadline6-dev'
    otherwise 'readline'
  }
end
dep 'yaml.lib' do
  installs {
    via :apt, 'libyaml-dev'
    otherwise 'libyaml'
  }
end
dep 'zlib.lib' do
  installs {
    via :apt, 'zlib1g-dev'
    via :yum, 'zlib-devel'
    via :brew, []
    otherwise 'zlib'
  }
end
