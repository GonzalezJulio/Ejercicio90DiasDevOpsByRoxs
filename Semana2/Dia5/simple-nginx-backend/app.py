from http.server import BaseHTTPRequestHandler, HTTPServer

class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        message = "Hola desde el backend de Julio 🚀"
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(message.encode())

server = HTTPServer(('', 5000), MyHandler)
print("Servidor escuchando en puerto 5000...")
server.serve_forever()
