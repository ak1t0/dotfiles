remote_file "/etc/apt/sources.list.d/tor.list" do
  user "root"
  owner "root"
  group "root"
  mode "644"
  source "tor/tor.list"
end

package "tor" do
  user "root"
  action :install
end
