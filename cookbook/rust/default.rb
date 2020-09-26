execute "intsall rustup and rust" do
  user node[:user]
  cwd "/tmp"
  command <<-EOC
  wget -O \"rustup.sh\" https://sh.rustup.rs
  chmod +x ./rustup.sh
  ./rustup.sh -y
  EOC
end

components = ["rls-preview", "rust-analysis", "rust-src"]
components.each do |c|
  execute "install #{c}" do
    user node[:user]
    command "export PATH=\"$HOME/.cargo/bin:$PATH\"; rustup component add #{c}"
  end
end
