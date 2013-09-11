# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

meta :append do
  accepts_value_for :file
  accepts_value_for :line

  def file_name
    File.expand_path(file)
  end

  def file_contents
    File.readlines(file_name)
  end

  def append_file!
    File.open(file_name, 'w') { |f| f.write(file_contents << "#{line}\n").join('') }
  end

  template do
    met? { file_contents.any? { |file_line| file_line =~ /#{Regexp.escape(line)}/ } }
    meet { append_file! }
  end
end
