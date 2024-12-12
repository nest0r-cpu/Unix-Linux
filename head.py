import socket

# Create a socket
s = socket.socket()
s.settimeout(2)  # Set a timeout for the socket

# Define the target server
target = 'target1.bowneconsulting.com'

# Connect to the server on port 80
s.connect((target, 80))

# Formulate the HEAD request
req = 'HEAD / HTTP/1.1\r\nHost: ' + target + '\r\n\r\n'

# Send the request
s.send(req.encode())

# Receive and print the response
print(s.recv(1024).decode())

# Close the socket
s.close()
