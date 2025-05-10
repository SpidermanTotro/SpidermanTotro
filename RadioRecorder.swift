
import AVFoundation

class RadioRecorder: NSObject, AVAudioRecorderDelegate {
    var recorder: AVAudioRecorder?

    func startRecording() {
        let fileName = NSTemporaryDirectory() + "radio_log.m4a"
        let url = URL(fileURLWithPath: fileName)
        let settings: [String: Any] = [
            AVFormatIDKey: kAudioFormatMPEG4AAC,
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            recorder = try AVAudioRecorder(url: url, settings: settings)
            recorder?.delegate = self
            recorder?.record()
            print("Recording started: \(url.lastPathComponent)")
        } catch {
            print("Recording failed to start")
        }
    }

    func stopRecording() {
        recorder?.stop()
        print("Recording stopped")
    }
}
