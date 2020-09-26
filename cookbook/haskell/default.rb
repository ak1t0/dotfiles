execute "install stack" do
  user node[:user]
  command "wget -qO- https://get.haskellstack.org/ | sh"
end

execute "upgrade stack" do
  command "stack upgrade"
end

execute "install GHC" do
  command "stack setup"
end
