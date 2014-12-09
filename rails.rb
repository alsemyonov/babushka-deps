# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################


dep 'database migrated', :env, :deploying, :template => 'task' do
  run {
    shell "bundle exec rake db:migrate RAILS_ENV=#{env}"
  }
end

dep 'rails update', :path do
  requires 'common:app bundled'.with(path)
  requires 'database migrated'.with(path)
  requires 'common:assets precompiled'.with(path)
end
