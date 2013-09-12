# coding: utf-8

################################################
# © Alexander Semyonov, 2013—2013, MIT         #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

meta :append do
  accepts_value_for :file
  accepts_value_for :line

  def file_name
    file.p
  end

  def file_contents
    file_name.read.split("\n")
  end

  def append_file!
    file_name.append(line)
  end

  template do
    met? { !file_contents.grep(/#{Regexp.escape(line)}/).empty? }
    meet { append_file! }
  end
end
