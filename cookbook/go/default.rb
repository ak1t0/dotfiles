execute "download Go" do
  user node[:user]
  cwd "/tmp"
  command "wget https://golang.org/dl/go#{node[:versions][:go]}.linux-amd64.tar.gz"
end

execute "decompress" do
  user node[:user]
  cwd "/tmp"
  command "tar xvf go#{node[:versions][:go]}.linux-amd64.tar.gz"
end

execute "install Go" do
  user "root"
  cwd "/tmp"
  command "chown -R root:root ./go; mv ./go /usr/local"
  not_if "test -e /usr/local/go/bin/go"
end
