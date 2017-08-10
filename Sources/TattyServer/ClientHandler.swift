import Foundation
import Sockets
import TattyCore

class ClientHandler {
    let socket: TCPEstablishedSocket

    init(socket: TCPEstablishedSocket) {
        self.socket = socket
    }

    func run() throws {
        try self.sendMessage("Your name: \r")
        let user = User(name: try self.receiveMessage())

        while(true) {
            try self.sendMessage("> \r")
            print("\(user.name): \(try self.receiveMessage())")
        }
    }

    func receiveMessage() throws -> String {
        return try socket.read(max: 2048).makeString()
    }

    func sendMessage(_ message: String) throws {
        _ = try socket.write(message)
    }
}
