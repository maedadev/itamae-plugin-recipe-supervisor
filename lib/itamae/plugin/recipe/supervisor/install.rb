pip 'supervisor' do
  user 'root'
  version '4.1.0'
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
