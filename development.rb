# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

dep 'development apps installed' do
  requires 'nginx.bin'
  requires 'rabbitmq.bin'
  requires 'redis.bin'
  requires 'postgresql.bin'
  requires 'mongodb.bin'
  requires 'nodejs.bin'
end

dep 'development ruby', :version do
  requires 'ruby global.rbenv'.with(version)
  requires 'bundler.gem'
  requires 'thor.gem'
  requires 'yard.gem'
  requires 'foreman.gem'
  requires 'gem-browse.gem'
  # requires 'gem-ctags.gem'
end

dep 'development node', :version do
  requires 'node'
  requires 'bower'
  requires 'less2sass'
  requires 'sassdoc'
end

dep 'development' do
  requires 'development node'
  requires 'development ruby'
  requires 'development apps installed'
end
