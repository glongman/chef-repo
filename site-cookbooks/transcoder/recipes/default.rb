#
# Cookbook Name:: transcoder
# Recipe:: default
#
# Copyright 2009, Overlay TV
#
# All rights reserved - Do Not Redistribute
#

%w(ffmpeg transcoder::gd2 transcoder::gpac transcoder::gpac transcoder::rvideo).each do |r|
  include_recipe r
end
