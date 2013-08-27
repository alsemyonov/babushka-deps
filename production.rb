# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

dep 'production apps installed' do
  requires 'nginx.bin'
  requires 'rabbitmq.bin'
  requires 'redis.bin'
  requires 'postgresql.bin'
  requires 'mongodb.bin'
  requires 'nodejs.bin'
end

dep 'production ruby', :version do
  version.default!('2.0.0-p247')

  requires 'ruby.rbenv'.with(version)
  requires 'bundler.gem'
  requires 'foreman.gem'
  requires 'gem-browse.gem'
end

dep 'production' do
  requires 'production ruby'
  requires 'production apps installed'
end
