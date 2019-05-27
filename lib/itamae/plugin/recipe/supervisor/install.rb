execute 'pip install supervisor' do
  user 'root'
  not_if 'test `which supervisord`'
end

template '/etc/supervisord.conf' do
  user 'root'
  owner 'root'
  group 'root'
  mode '644'
end

directory '/etc/supervisor.d' do
  user 'root'
  owner 'root'
  group 'root'
  mode '755'
end

case "#{node.platform_family}-#{node.platform_version}"
when /rhel-6\.(.*?)/
  template '/etc/init.d/supervisord' do
    user 'root'
    owner 'root'
    group 'root'
    mode '755'
  end
when /rhel-7\.(.*?)/
  template '/etc/systemd/system/supervisord.service' do
    user 'root'
    owner 'root'
    group 'root'
    mode '755'
  end

  execute 'systemctl daemon-reload' do
    user 'root'
    action :nothing
    subscribes :run, 'template[/etc/systemd/system/supervisord.service]', :immediately
  end
else
  raise "unsupported platform #{node.platform_family}-#{node.platform_version}"
end
