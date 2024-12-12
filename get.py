import socket

# Create a socket
s = socket.socket()
s.settimeout(2)

# Define the target server
target = 'target1.bowneconsulting.com'

# Connect to the server on port 80
s.connect((target, 80))

# Formulate the GET request from Wireshark
req = """GET /php/login1.php?u=a&p=b HTTP/1.1\r
Host: target1.bowneconsulting.com\r
User-Agent: python\r
Connection: close\r
\r
"""

# Send the GET request
s.send(req.encode())

# Receive and print the response
print(s.recv(4096).decode())

# Close the socket
s.close()
