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
end

dep 'production apps installed.task' do
  run do
    system("sudo -i babushka 'production apps installed using sudo'")
    shell('sudo chown -R $USER "$(rbenv root)"')
  end
end

dep 'production' do
  requires 'production ruby'
  requires 'production node'
  requires 'production apps installed.task'
end
