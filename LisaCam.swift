
import AVFoundation
import UIKit

class LisaCam: NSObject, AVCapturePhotoCaptureDelegate {
    let session = AVCaptureSession()
    let output = AVCapturePhotoOutput()

    func startCameraPreview(on view: UIView) {
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device) else { return }

        session.beginConfiguration()
        if session.canAddInput(input) { session.addInput(input) }
        if session.canAddOutput(output) { session.addOutput(output) }
        session.commitConfiguration()

        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)

        session.startRunning()
    }

    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        output.capturePhoto(with: settings, delegate: self)
    }

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        print("LisaCam captured image: \(imageData.count) bytes")
    }
}
