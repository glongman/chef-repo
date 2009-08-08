#
# Cookbook Name:: ffmpeg
# Recipe:: dependencies
#
# Copyright 2009, Overlay TV
#
# All rights reserved - Do Not Redistribute
#

multiverse_repos = ["deb http://us.archive.ubuntu.com/ubuntu/ intrepid multiverse",
"deb-src http://us.archive.ubuntu.com/ubuntu/ intrepid multiverse",
"deb http://us.archive.ubuntu.com/ubuntu/ intrepid-updates multiverse",
"deb-src http://us.archive.ubuntu.com/ubuntu/ intrepid-updates multiverse"]

multiverse_repos.each do |repo|
  execute "add-repo_#{repo}" do
     command %Q(sudo echo "#{repo}" >> /etc/apt/sources.list')
     action :run
  end
end