require('sinatra')
require('sinatra/reloader')
# require('./lib/task')
require('./lib/doctor')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "doctors_office"})

get("/") do
  erb(:index)
end

get("/doctors/new") do
  erb(:doctor_form)
end

post("/doctors") do
  name = params.fetch("name")
  doctor = Doctor.new({:id => nil, :name => name})
  doctor.save()
  erb(:success)
end

get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctors)
end
