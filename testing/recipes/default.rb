template "/etc/yum.repos.d/clients.repo" do
    mode 00644
    source "clients.repo.erb"
    variables(
        :dist => node["dist"]
        )
end
