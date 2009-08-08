%w(echoe rspec).each do |g|
  gem_package g do
    action :install
  end
end

directory 'tmp/rvideo' do
  ignore_failure true
  recursive true
  not_if "gem list | grep rvideo"
  notifies :run, resources(:bash => 'get rvideo'), :immediate
end

bash 'get rvideo' do
  cwd '/tmp'
  code <<-EOH
    git clone git://github.com/greatseth/rvideo.git
    cd rvideo
    rake install
    EOH
  notifies :run, resources(:bash => 'install rvideo'), :immediate
  action :nothing
end

bash 'install rvideo' do
  cwd '/tmp/rvideo'
  code <<-EOH
    rake install pkg/rvideo*.gem
    EOH
  not_if "gem list | grep rvideo"
end
  
  