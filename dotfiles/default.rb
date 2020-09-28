# git
remote_file "/home/#{node[:user]}/.gitconfig" do
  owner node[:user]
  source "git/.gitconfig"
end
remote_file "/home/#{node[:user]}/.gitignore" do
  owner node[:user]
  source "git/.gitignore"
end

# zsh
git "/home/#{node[:user]}/.zplug" do
  user node[:user]
  repository "git://github.com/zplug/zplug.git"
end

remote_file "/home/#{node[:user]}/.zshrc" do
  owner node[:user]
  source "zsh/.zshrc"
end

remote_directory "/home/#{node[:user]}/.zsh" do
  owner node[:user]
  source "zsh/local"
end

execute "set zsh" do
  user "root"
  command "chsh -s /bin/zsh"
end

# emacs
 remote_file "/home/#{node[:user]}/.emacs.d/init.el" do
  owner node[:user]
  source "emacs/init.el"
end

remote_directory "/home/#{node[:user]}/.emacs.d/emacs" do
  owner node[:user]
  source "emacs/emacs"
end

# tmux
remote_file "/home/#{node[:user]}/.tmux.conf" do
  owner node[:user]
  source "tmux/.tmux.conf"
end
