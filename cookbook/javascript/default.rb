execute "add node repository" do
  user "root"
  command "curl -sL https://deb.nodesource.com/setup_lts.x | bash -"
end

package "nodejs" do
  user "root"
  action :install
end
