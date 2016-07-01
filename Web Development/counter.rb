require "socket"

def parse_request(request_line)
  http_method, path_and_params, http = request_line.split(" ")
  path, params = path_and_params.split("?")

  params = (params || "").split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end 
    # will evaluate to empty hash due to empty string option, if no params are given in url.

  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if request_line =~ /favicon/
  puts request_line
  next unless request_line

  http_method, path, params = parse_request(request_line)

  # HTTP resonse - will include status code, header, body for browser to interpret
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts # need empty line between header and body
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
    # will allow text to be rendered without modifications, so they will continue to appear on three separate lines
  client.puts request_line
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter!</h1>"

  number = params["number"].to_i # nil.to_i automatically evalutes to 0
  client.puts "The current number is <p>#{number}</p>"

  client.puts "<a href='?number=#{number + 1}'>Add One</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract One</a> "
  # since HTTP is stateless, we store the updated and saved number in the url, so that it appears as though the program is stateful, when we're really not storing the value of that

  client.puts "</body>"
  client.puts "</html"

  client.close
end

