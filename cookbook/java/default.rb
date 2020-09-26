package "openjdk-#{node[:versions][:java]}-jdk" do
  user "root"
  action :install
end

execute "download Leiningen script" do
  user "root"
  cwd "/usr/local/bin"
  command "sudo wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && chmod a+x ./lein"
end

execute "install Leiningen" do
  user node[:user]
  command "lein"
end

