import Dispatch
import Sockets
import TattyCore

let address = InternetAddress(hostname: "127.0.0.1", port: 2229)

print("creating socket at \(address.hostname):\(address.port)")

var _socket = try TCPInternetSocket(address)
try _socket.connect()
let socket = TCPEstablishedSocket(descriptor: _socket.descriptor)

DispatchQueue.global().async {
    while(true) {
        let message = try? socket.read(max: 2048).makeString()
        if let message = message {
            print(message)
        }
    }
}

while(true) {
    let name = readLine()
    _ = try socket.write(name!)
    let user = User(name: name!)

    if let msg = readLine() {
        if msg == "/exit" {
            break
        }
        _ = try socket.write(msg)
    }
}
