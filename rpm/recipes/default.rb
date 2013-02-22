cookbook_file "/etc/yum.repos.d/brew.repo" do
    mode 00644
end
cookbook_file "/etc/yum.repos.d/rhpkg.repo" do
    mode 00644
end

bash "yum_install_packages" do
   code <<-EOH
   yum install -y brewkoji rhpkg fedpkg git git-review
   EOH
end
