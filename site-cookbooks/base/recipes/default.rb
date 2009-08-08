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
include_recipe "subversion"
include_recipe "git-core"
include_recipe "checkinstall"

