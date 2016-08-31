# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

dep 'development servers installed' do
  requires 'nginx.bin'
  requires 'rabbitmq.bin'
  requires 'redis.bin'
  requires 'postgresql.bin'
end

dep 'development apps installed' do
  requires 'Cloud Apps'
  requires 'Browsers'
  requires 'System Utilities'
  requires 'CLI Utilities'
  requires 'Fonts'
end

dep 'development' do
  requires 'development node'

  requires 'development ruby'
  requires 'test ruby'

  requires 'development servers installed'
  requires 'development apps installed'
end
