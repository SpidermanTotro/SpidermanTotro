
import Foundation
import Network

class GhostTracker {
    let monitor = NWPathMonitor()
    var currentIP: String = "Unknown"

    func startTracking() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.currentIP = self.getIPAddress()
                print("GhostTracker: Connected - IP: \(self.currentIP)")
            } else {
                print("GhostTracker: Connection Lost")
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }

    private func getIPAddress() -> String {
        // IP retrieval simulation
        return "192.168.1.101"
    }
}
