docker_packages = ["apt-transport-https", "ca-certificates", "curl", "software-properties-common"]

docker_packages.each do |p|
  package p do
    user "root"
    action :install
  end
end

execute "register docker gpg" do
  user "root"
  command "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -"
end

execute "add repository" do
  user "root"
  command "add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\""
end

package "docker-ce" do
  user "root"
  action :install
end
