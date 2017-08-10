import Sockets
import Dispatch

let address = InternetAddress(hostname: "127.0.0.1", port: 2229)

print("creating socket at \(address.hostname):\(address.port)")

let server = try Server(address: address)
try server.run()
