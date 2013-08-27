# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

dep 'nginx.bin'
dep 'postgresql.bin' do
  provides 'pg_ctl', 'pg_config', 'psql'
end
dep 'mysql.bin' do
  provides 'mysqld', 'mysql'
  on(:linux) { installs 'mysql-server' }
end
dep 'rabbitmq.bin' do
  provides 'rabbitmqctl'
  on(:linux) { installs 'rabbitmq-server' }
end
dep 'ejabberd.bin' do
  provides 'ejabberdctl'
end
dep 'redis.bin' do
  provides 'redis-cli', 'redis-server'
  on(:linux) do
    requires 'ppa'.with(spec: 'ppa:rwky/redis')
    installs 'redis-server'
  end
end
dep 'mongodb.bin' do
  provides 'mongod', 'mongo'
  on(:linux) do
    requires 'apt source'.with(uri: 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart', release: 'dist', repo: '10gen', should_update: 'yes')
    installs 'mongodb-10gen'
  end
end
