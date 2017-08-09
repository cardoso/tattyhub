import Foundation
import Sockets

class ClientHandler {
    let socket: TCPEstablishedSocket

    init(socket: TCPEstablishedSocket) {
        self.socket = socket
    }

    func run() throws {
        let msg = try socket.read(max: 2048).makeString()
        print("client sent: \(msg)")
    }
}
