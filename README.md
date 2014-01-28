##Morsel

Morsel is a Sintra-like micro framework for declaring routes and handling requests.
It is built on top of [HttpServer.jl](https://github.com/hackerschool/HttpServer.jl)
and [Meddle.jl](https://github.com/hackerschool/Meddle.jl).

## Installation

```jl
# in REQUIRE
Morsel 0.0.1

# in REPL
julia> Pkg.add("Morsel")
```

## Example

Here is a brief example that will return a few different messages for different routes,
if you run this and open `localhost:8000` you will see "This is the root" for GET, POST or PUT requests.
The line `get(app, "/about") do ...` is shorthand for only serving GET requests through that route.

```.jl
using Morsel

app = Morsel.app()

route(app, GET | POST | PUT, "/") do req, res
    "This is the root"
end

get(app, "/about") do req, res
    "This app is running on Morsel"
end

start(app, 8000)
```

~~~~
:::::::::::::
::         ::
:: Made at ::
::         ::
:::::::::::::
     ::
Hacker School
:::::::::::::
~~~~
