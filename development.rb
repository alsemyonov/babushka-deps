# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

dep 'development apps installed' do
  requires 'ruby with common gems'
  requires 'nginx.bin'
  requires 'rabbitmq.bin'
  requires 'redis.bin'
  requires 'mysql.bin'
  requires 'postgresql.bin'
  requires 'mongodb.bin'
  requires 'nodejs.bin'
end

dep 'development' do
  requires 'development apps installed'
end
