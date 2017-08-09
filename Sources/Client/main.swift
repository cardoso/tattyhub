import Sockets

let address = InternetAddress(hostname: "127.0.0.1", port: 2229)

print("creating socket at \(address.hostname):\(address.port)")

let socket = try TCPInternetSocket(address)
try socket.connect()

while(true) {
    if let msg = readLine() {
        if msg == "/exit" {
            break
        }

        print("sending message: \(msg)")
        _ = try socket.write(msg)
    }
}
