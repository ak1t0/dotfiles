ruby_packages = ["libssl-dev", "libreadline-dev", "zlib1g-dev"]

ruby_packages.each do |p|
  package p do
    user "root"
    action :install
  end
end

git "/home/#{node[:user]}/.rbenv" do
  repository "git://github.com/rbenv/rbenv.git"
end

git "/home/#{node[:user]}/.rbenv/plugins/ruby-build" do
  user "root"
  repository "git://github.com/rbenv/ruby-build.git"
end

execute "install Ruby" do
  user node[:user]
  command "export PATH=$PATH:$HOME/.rbenv/bin; rbenv install #{node[:versions][:ruby]}"
end

execute "set Ruby" do
  user node[:user]
  command "export PATH=$PATH:$HOME/.rbenv/bin; rbenv global #{node[:versions][:ruby]}"
end
