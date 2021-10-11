//
//  ScanRecipientViewController.swift
//  OnPortion
//
//  Created by Daniella Onishi on 10/10/21.
//

import UIKit
import AVFoundation

class ScanRecipientViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    @IBOutlet weak var topBackgroundView: UIVisualEffectView!
    let blurEffect = UIBlurEffect(style: .light)
    
    @IBOutlet weak var objectIdentifierView: UIView!
    let imagePredictor = ImagePredictor()
    
    private let captureSession = AVCaptureSession()
    
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let preview = AVCaptureVideoPreviewLayer(session: self.captureSession)
        preview.videoGravity = .resizeAspect
        return preview
    }()
    
    private let videoOutput = AVCaptureVideoDataOutput()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBackgroundView.effect = blurEffect
        self.addCameraInput()
        self.addPreviewLayer()
        self.addVideoOutput()
        self.captureSession.startRunning()
        
    }
    
    private func addCameraInput() {
        let device = AVCaptureDevice.default(for: .video)!
        let cameraInput = try! AVCaptureDeviceInput(device: device)
        self.captureSession.addInput(cameraInput)
    }
    
    private func addPreviewLayer() {
        self.objectIdentifierView.layer.addSublayer(self.previewLayer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.previewLayer.frame = self.view.bounds
    }
    
    private func addVideoOutput() {
        self.videoOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString) : NSNumber(value: kCVPixelFormatType_32BGRA)] as [String : Any]
        self.videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "my.image.handling.queue"))
        self.captureSession.addOutput(self.videoOutput)
    }
    
    private var counter = 0
    private let checkInterval = 4
    
    func captureOutput(_ output: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from connection: AVCaptureConnection) {
        guard let uiImage = sampleBuffer.imageWithCGImage() else {
            debugPrint("unable to get image from sample buffer")
            return
        }
        
        if counter % checkInterval == 0 {
            try? imagePredictor.makePredictions(for: uiImage) { predictions in
                print(predictions)
            }
        }
        counter += 1
        
    }
    
}
