# get relevant packages
package "git" do
    action :install
end

package "tig" do
    action :install
end

git "/home/vagrant/devstack" do
    user "vagrant"
    repository "https://github.com/openstack-dev/devstack.git"
    action :sync
end

template "/home/vagrant/devstack/localrc" do
	mode 0755
	owner "vagrant"
	source "localrc.erb"
	variables(node["devstack"])
end

bash "fix_glance_bullshit" do
	user "vagrant"
	cwd "/home/vagrant/devstack"
	code <<-EOH
		sed -r -i 's/(iniset \$GLANCE_API_CONF DEFAULT notifier_strategy) qpid/\1 noop/' lib/glance
	EOH
end
