import Sockets
import Dispatch

class Server {
    let socket: TCPInternetSocket

    init(address: InternetAddress) throws {
        self.socket = try TCPInternetSocket(address)
        try socket.bind()
        try socket.listen(max: 4096)
    }

    func run() throws {
        while(true) {
            try self.acceptClient()
        }
    }

    func acceptClient() throws {
        let socket = try self.socket.accept()
        DispatchQueue.global().async {
            let handler = ClientHandler(socket:
                TCPEstablishedSocket(descriptor: socket.descriptor))
            try? handler.run()
        }
    }
}
