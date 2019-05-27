service 'supervisord' do
  user 'root'
  action [:disable, :stop]
  only_if 'test -e /var/run/supervisord.pid'
end
