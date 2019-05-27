service 'supervisord' do
  user 'root'
  action [:enable, :start]
end
