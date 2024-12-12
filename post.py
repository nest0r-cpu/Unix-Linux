import socket

# Create a socket
s = socket.socket()
s.settimeout(2)

# Define the target server
target = 'target1.bowneconsulting.com'

# Connect to the server on port 80
s.connect((target, 80))

# Formulate the POST request based on the captured TCP stream
req = """POST /php/login2.php HTTP/1.1\r
Host: target1.bowneconsulting.com\r
Connection: close\r
Content-Length: 17\r
Content-Type: application/x-www-form-urlencoded\r
User-Agent: python\r
\r
u=dumbo&p=dumbo\r
"""

# Print the request for debugging
print("=== Request Sent ===")
print(req)

# Send the POST request
s.send(req.encode())

# Receive and print the response
response = s.recv(4096).decode()
print("=== Response ===")
print(response)

# Close the socket
s.close()

