from flask import Flask
# import socket

# # Create a TCP/IP socket
# sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# # Bind the socket to the port
# server = socket.gethostname()
# port = 8080
# server_address = (server, port)
# sock.bind(server_address)
# sock.listen(1)

app = Flask(__name__)

@app.route("/")
def hello():
    return 'Hello World'

if __name__ == 'main':
    app.run(host='0.0.0.0', port =8080)
