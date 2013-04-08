package "zsh" do
    action :install
end

cookbook_file "/home/vagrant/.zshrc" do
	mode 0644
	source "zshrc"
	owner "vagrant"
	group "vagrant"
end

bash "use_zsh" do
	code <<-EOH
        usermod -s /bin/zsh vagrant 
	EOH
end
