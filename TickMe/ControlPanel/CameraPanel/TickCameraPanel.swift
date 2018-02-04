//
//  TickCameraPanel.swift
//  TickMe
//
//  Created by Boning Dong on 11/21/17.
//  Copyright © 2017 Yini Wang. All rights reserved.
//

import UIKit
import AVFoundation

class TickCameraPanel: UIViewController {
    
    @IBOutlet var previewView: UIView!;
    @IBOutlet var captureBtn: UIButton!;
    @IBOutlet var returnBtn: UIButton!;
    
    var captureSession = AVCaptureSession();
    var backCamera: AVCaptureDevice?
    var imageOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    var capturedImage: UIImage?
    
    // Apperance Related
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // Camera Related
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initializing the button
        returnBtn.superview?.bringSubview(toFront: returnBtn);
        captureBtn.superview?.bringSubview(toFront: captureBtn);
        setupCaptureSession();
        setupCameraDevice();
        setupInputOutput();
        setupPreviewLayer();
        startRunningCaptureSession();
    
    }
    
    
    func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo;
    }
    
    func setupCameraDevice() {
        let deviceDiscoverSession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified);
        let devices = deviceDiscoverSession.devices;
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device;
            }
        }
    }
    
    func setupInputOutput() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: backCamera!);
            captureSession.addInput(captureDeviceInput);
            imageOutput = AVCapturePhotoOutput();
            imageOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil);
            captureSession.addOutput(imageOutput!);
        } catch {
            print(error);
        }
    }
    
    func setupPreviewLayer() {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
        previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill;
        previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait;
        previewLayer?.frame = previewView.bounds;
        previewView.layer.addSublayer(previewLayer!);
        
    }
    
    func startRunningCaptureSession() {
        captureSession.startRunning();
    }
    
    // Execute when button is clicked
    @IBAction func didTakePhoto() {
        let captureSetting = AVCapturePhotoSettings();
        imageOutput?.capturePhoto(with: captureSetting, delegate: self);
    }
    
    // Execute before running segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print ("Running the prepare function!");
        if segue.identifier == "showPhoto_segue" {
            let cameraPreviewVC = segue.destination as! TickPhotoPreview;
            cameraPreviewVC.capturedImage = self.capturedImage;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TickCameraPanel: AVCapturePhotoCaptureDelegate {
    
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            capturedImage = UIImage(data: imageData);
            performSegue(withIdentifier: "showPhoto_segue", sender: nil)
        }
    }
}
