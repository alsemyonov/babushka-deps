# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################


dep 'database migrated', :env, :template => 'task' do
  run {
    shell "bundle exec rake db:migrate RAILS_ENV=#{env}"
  }
end


dep 'assets precompiled', :env, :template => 'task' do
  run {
    shell "bundle exec rake assets:precompile RAILS_GROUPS=assets RAILS_ENV=#{env}"
  }
end

dep 'rails update', :path, :env do
  path.default!(Dir.pwd)
  env.default!(ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'production')

  requires 'common:app bundled'.with(path, env)
  requires 'database migrated'.with(env)
  requires 'assets precompiled'.with(env)
end
