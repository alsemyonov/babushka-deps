# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

dep 'production apps installed using sudo' do
  requires 'nginx.bin'
  requires 'rabbitmq.bin'
  requires 'redis.bin'
  requires 'postgresql.bin'
  requires 'mongodb.bin'
  requires 'nodejs.bin'
end

dep 'production apps installed.task' do
  run do
    system("sudo -i babushka 'production apps installed using sudo'")
    shell('sudo chown -R $USER "$(rbenv root)"')
  end
end

dep 'production ruby', :version do
  requires 'ruby.rbenv'.with(version)
  requires 'bundler.gem'
  requires 'foreman.gem'
  requires 'gem-browse.gem'
end

dep 'production' do
  requires 'production ruby'
  requires 'production apps installed.task'
end
