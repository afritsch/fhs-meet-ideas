set :output, "whenever.log"

every 1.day, :at => '2:00 am' do
  runner "Project.remove_old"
end
