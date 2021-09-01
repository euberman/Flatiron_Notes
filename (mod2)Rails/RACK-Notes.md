# Rack Notes

## Config.ru defaults
``` ruby
require_relative "./config/environment.rb"
run Application.new
```

## Default application setup

```ruby
class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    #resp.write here

    resp.finish
  end
end
```

## HTTP requests

  "https://github.com/    search    ?       q=apples \
 |___ Domain ________| |_path_|       |_Get Parameter_|


## HTTP Verbs

VERB	      DESCRIPTION
HEAD	      Asks for a response like a GET but without the body
GET	        Retrieves a representation of a resource
POST	      Submits data to be processed in the body of the request
PUT	        Uploads a representation of a resource in the body of the request
DELETE	    Deletes a specific resource
TRACE	      Echoes back the received request
OPTIONS	    Returns the HTTP methods the server supports
CONNECT	    Converts the request to a TCP/IP tunnel (generally for SSL)
PATCH	      Apply a partial modification of a resource

Status Codes
100's - informational
200's - success
300's - redirect
400's - error
500's - server error
