bash "yum_install_cool_stuff" do
   code <<-EOH
   yum install -y vim git tig ncdu tree atool tmux mc ack atool htop
   EOH
end

cookbook_file "/home/vagrant/.tmux.conf" do
    action :create
    source "tmux.conf"
    owner "vagrant"
    group "vagrant"
    mode 00644
end

cookbook_file "/home/vagrant/.vimrc" do
    action :create
    source "vimrc"
    owner "vagrant"
    group "vagrant"
    mode 00644
end

cookbook_file "/home/vagrant/.gitconfig" do
    action :create_if_missing
    source "gitconfig"
    owner "vagrant"
    group "vagrant"
    mode 00644
end

cookbook_file "/root/.gitconfig" do
    action :create_if_missing
    source "gitconfig"
    mode 00644
end

cookbook_file "/etc/krb5.conf" do
    mode 00644
end

jru_pkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPWtlbVYcz9wqDD6e6LwNyDJTzr+gwQNfnRXie+V53SfB0APcVTZiWjoxyV5+RtcYJ8Ip784WFa4tDx7I1SumO1Jp55XptEgB5mIiMc3bia+2XWLUvU8v/atmSYjoj4PrmkTaFVqRzWFI8oAKuEODXQDKjMdkRjfq7e4JVn8Sk8/5/2wz+ZvR8FL1Fgw6uGSjvalo7FE/6gZ5WY0NQnhr3/oZiA0u7zEnpBWoAIsh/CoqeCUQq3kqN35MqwUe8aDMoXbn4pCnYthDZAaHn42m54ikONOYaQxMEm2McQfRP3V1VhkDQ8vDhqU4xNmZkI8KAFfMcgjA5gCUmG/ciPX6/ jruzicka@alcard"
jru_pkey_rex = Regexp.new(Regexp.escape(jru_pkey.split('/')[0]))

ruby_block "public_key" do
    block do
        file = Chef::Util::FileEdit.new("/home/vagrant/.ssh/authorized_keys")
        file.insert_line_if_no_match(jru_pkey_rex, jru_pkey)
        file.write_file
    end
end
