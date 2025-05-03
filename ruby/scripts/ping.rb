ip_address = gets.chomp

# Ping the IP address
response = `ping #{ip_address} -c 4`

# Print the response
puts response