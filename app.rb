require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/train")
require("./lib/town")
require("pg")

DB = PG.connect({:dbname => "trains_stops"})

get("/") do
    erb(:index)
end
