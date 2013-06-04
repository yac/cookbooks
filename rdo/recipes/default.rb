bash "install RDO repo" do
   code <<-EOH
   yum install -y http://rdo.fedorapeople.org/openstack/openstack-grizzly/rdo-release-grizzly-3.noarch.rpm
   EOH
end
