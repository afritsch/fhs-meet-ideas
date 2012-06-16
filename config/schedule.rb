set :output, "whenever.log"

every 1.day, :at => '2:00 am' do
  runner "Version.remove_old"
end
