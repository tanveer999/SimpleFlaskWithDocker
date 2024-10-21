from flask import Flask
import os
import requests
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

@app.route("/test/login")
def hello():
    # username = os.environ.get('USER')
    return f'Hello Naruto'

if __name__ == 'main':
    app.run(host="0.0.0.0", port=80)
