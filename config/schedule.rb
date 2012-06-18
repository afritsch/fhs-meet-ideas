set :output, "whenever.log"

every 10.minutes do
  runner "Project.remove_old"
end
