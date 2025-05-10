
import Foundation

struct EmotionLogEntry {
    let timestamp: Date
    let emotion: String
    let notes: String
}

class EmotionLog {
    var entries = [EmotionLogEntry]()

    func record(emotion: String, notes: String) {
        let entry = EmotionLogEntry(timestamp: Date(), emotion: emotion, notes: notes)
        entries.append(entry)
        print("Emotion Logged: \(emotion) @ \(entry.timestamp)")
    }

    func listAll() {
        entries.forEach { print("\($0.timestamp): \($0.emotion) - \($0.notes)") }
    }
}
