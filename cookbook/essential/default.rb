packages = [
  "emacs",
  "git",
  "zsh",
  "tmux",
  "curl",
  "binutils",
  "build-essential",
  "gconf2",
  "xclip",
  "pkg-config",
  "libssl-dev",
  "cmake",
  "exuberant-ctags",
  "texinfo",
  "zlib1g-dev"
]

packages.each do |p|
  package p do
    user "root"
    action :install
  end
end
