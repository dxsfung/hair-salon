require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")
require("pry")

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
    erb(:index)
end

get('/stylists') do
    @stylists = Stylist.all()
    @clients = Client.all()
    erb(:stylists)
end

get('/clients') do
    @clients = Client.all()
    erb(:clients)
end
