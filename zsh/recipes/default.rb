package "zsh" do
    action :install
end

template "/home/vagrant/.zshrc" do
	mode 0755
	source "zshrc.erb"
	owner "vagrant"
end

bash "use_zsh" do
	user "vagrant"
	code <<-EOH
        sudo usermod -s /bin/zsh vagrant 
	EOH
end
