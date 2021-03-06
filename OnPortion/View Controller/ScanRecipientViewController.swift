//
//  ScanRecipientViewController.swift
//  OnPortion
//
//  Created by Daniella Onishi on 10/10/21.
//

import UIKit
import AVFoundation

class ScanRecipientViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    var defininingCalculatorRole: ConversionCalculatorItemRole = .source
    
    @IBOutlet weak var topBackgroundView: UIVisualEffectView!
    @IBOutlet weak var bottomBackgroundView: UIVisualEffectView!
    let blurEffect = UIBlurEffect(style: .light)
    
    @IBOutlet weak var objectIdentifierView: UIView!
    @IBOutlet weak var objectNameLabel: UILabel!
    
    let imagePredictor = ImagePredictor()
    
    private let captureSession = AVCaptureSession()
    
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let preview = AVCaptureVideoPreviewLayer(session: self.captureSession)
        preview.videoGravity = .resizeAspect
        return preview
    }()
    
    private let videoOutput = AVCaptureVideoDataOutput()
    
    var currentRecipient: Recipient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBackgroundView.effect = blurEffect
        bottomBackgroundView.effect = blurEffect
        
        self.addCameraInput()
        self.addPreviewLayer()
        self.addVideoOutput()
        self.captureSession.startRunning()
        
    }
    
    @IBAction func checkButtonOnPress(_ sender: Any) {
        // garanta que o recipiente existe ou seja o modelo encontrou recipiente ou retorne faz novo
        guard let recipient = currentRecipient else {
            return
        }
        
        // adiciona na calculadora atual
        ModelSingleton.shared.currentCalculator.add(recipient: recipient, as: defininingCalculatorRole)
        
        if defininingCalculatorRole == .source {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let resultVC = storyboard.instantiateViewController(identifier: "ConversionToViewController") as? ConversionToViewController else { return }
            resultVC.modalPresentationStyle = .fullScreen
            self.present(resultVC, animated: true, completion: nil)
        } else if defininingCalculatorRole == .target {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let resultVC = storyboard.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else { return }
            resultVC.modalPresentationStyle = .fullScreen
            self.present(resultVC, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func crossButtonOnPress(_ sender: Any) {
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
                guard let maxConfidencePrediction = predictions?.max(by: { p1, p2 in
                    Double(p1.confidencePercentage) ?? 0 < Double(p2.confidencePercentage) ?? 0
                }) else {
                    return
                }
                
                DispatchQueue.main.async {
                    if let confidence = Double(maxConfidencePrediction.confidencePercentage),
                       confidence > 0.9,
                       let recipient = ModelSingleton.shared.getRecipient(for: maxConfidencePrediction.classification) {
                        self.objectNameLabel.text = "Is this \(recipient.name)?"
                        self.currentRecipient = recipient
                        
                        // TODO: Atualizar uma variavel do self chamada currentRecipient
                    } else {
                        self.objectNameLabel.text = "Searching..."
                        self.currentRecipient = nil
                    }
                }
            }
        }
        counter += 1
    }
}
