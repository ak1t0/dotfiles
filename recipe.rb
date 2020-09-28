# config
include_recipe 'cookbook/config/default.rb'
# package
include_recipe 'cookbook/essential/default.rb'
# dotfiles
include_recipe 'dotfiles/default.rb'
# dev
include_recipe 'cookbook/go/default.rb'
include_recipe 'cookbook/java/default.rb'
include_recipe 'cookbook/rust/default.rb'
include_recipe 'cookbook/ruby/default.rb'
include_recipe 'cookbook/haskell/default.rb'


