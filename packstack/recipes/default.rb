package "git" do
    action :install
end

git "/home/vagrant/packstack" do
    user "vagrant"
    group "vagrant"
    repository "https://github.com/stackforge/packstack.git"
    # when cloning manually, don't forget to:
    # git submodule update --init
    revision "folsom"
    enable_submodules true
    action :sync
end

package "python-setuptools" do
    action :install
end

execute "install packstack" do
    cwd "/home/vagrant/packstack"
    command "python setup.py install"
end

execute "generate packstack answer file" do
    cwd "/home/vagrant"
    user "vagrant"
    group "vagrant"
    command "packstack --gen-answer-file=packstack_answers"
    creates "/home/vagrant/packstack_answers"
end
