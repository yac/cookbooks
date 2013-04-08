if node["dist"] == "rhel" then
    cookbook_file "/etc/yum.repos.d/epel-openstack-grizzly.repo" do
        action :create_if_missing
    end
else
    cookbook_file "/etc/yum.repos.d/fedora-openstack-grizzly.repo" do
        action :create_if_missing
    end
end
