#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2009, Overlay TV
#
# All rights reserved - Do Not Redistribute
#

execute "update apt" do
  command "sudo apt-get update -y"
  ignore_failure true
  action :run
end

include_recipe "build-essential"
include_recipe 'ruby'
include_recipe "subversion"

%w(git-core checkinstall).each do |p|
  package p do
     action :install
   end
end


