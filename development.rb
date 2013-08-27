# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

dep 'development apps installed' do
  requires 'nginx.bin'
  requires 'rabbitmq.bin'
  requires 'redis.bin'
  requires 'mysql.bin'
  requires 'postgresql.bin'
  requires 'mongodb.bin'
  requires 'nodejs.bin'
end

dep 'development ruby', :version do
  version.default!('2.0.0-p247')

  requires 'ruby global.rbenv'.with(version)
  requires 'bundler.gem'
  requires 'foreman.gem'
  requires 'gem-browse.gem'
  requires 'gem-ctags.gem'
end

dep 'development' do
  requires 'development ruby'
  requires 'development apps installed'
end
