//
//  QRCodeReaderViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 23/12/20.
//

import UIKit
import AVFoundation

class QRCodeReaderViewControllerPO: UIViewController, QRCodeReaderViewControllerDelegate {
    
    @IBOutlet weak var previewView: QRCodeReaderView! {
        didSet {
            previewView.setupComponents(with: QRCodeReaderViewControllerBuilder {
                $0.reader                 = reader
                $0.showTorchButton        = false
                $0.showSwitchCameraButton = false
                $0.showCancelButton       = false
                $0.showOverlayView        = true
                $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard checkScanPermissions(), !reader.isRunning else { return }
        
        reader.didFindCode = { result in
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(identifier: _vc_QRScanResultVC) as? QRScanResultViewController
            vc?.modalPresentationStyle = .overFullScreen
            vc?.delegateCustom = self
            self.present(vc!, animated: true, completion: nil)
            print("Completion with result: \(result.value) of type \(result.metadataType)")
        }
        
        reader.startScanning()
    }
    lazy var reader: QRCodeReader = QRCodeReader()
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader                  = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            $0.showTorchButton         = true
            $0.preferredStatusBarStyle = .lightContent
            $0.showOverlayView         = true
            $0.rectOfInterest          = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
            
            $0.reader.stopScanningWhenCodeIsFound = false
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    // MARK: - Actions
    
    private func checkScanPermissions() -> Bool {
        do {
            return try QRCodeReader.supportsMetadataObjectTypes()
        } catch let error as NSError {
            let alert: UIAlertController
            
            switch error.code {
            case -11852:
                alert = UIAlertController(title: "Error", message: "This app is not authorized to use Back Camera.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Setting", style: .default, handler: { (_) in
                    DispatchQueue.main.async {
                        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.openURL(settingsURL)
                        }
                    }
                }))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            default:
                alert = UIAlertController(title: "Error", message: "Reader not supported by the current device", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            }
            
            present(alert, animated: true, completion: nil)
            
            return false
        }
    }
    
    @IBAction func scanInModalAction(_ sender: AnyObject) {
        guard checkScanPermissions() else { return }
        
        readerVC.modalPresentationStyle = .formSheet
        readerVC.delegate               = self
        
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            if let result = result {
                print("Completion with result: \(result.value) of type \(result.metadataType)")
                let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_QRScanResultVC) as? QRScanResultViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
        
        present(readerVC, animated: true, completion: nil)
    }
    
    @IBAction func scanInPreviewAction(_ sender: Any) {
        guard checkScanPermissions(), !reader.isRunning else { return }
        
        reader.didFindCode = { result in
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(identifier: _vc_QRScanResultVC) as? QRScanResultViewController
            vc?.modalPresentationStyle = .overFullScreen
            vc?.delegateCustom = self
            self.present(vc!, animated: true, completion: nil)
            print("Completion with result: \(result.value) of type \(result.metadataType)")
        }
        
        reader.startScanning()
    }
    
    // MARK: - QRCodeReader Delegate Methods
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        
        dismiss(animated: true) { [weak self] in
            let alert = UIAlertController(
                title: "QRCodeReader",
                message: String (format:"%@ (of type %@)", result.value, result.metadataType),
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        print("Switching capture to: \(newCaptureDevice.device.localizedName)")
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension QRCodeReaderViewControllerPO: ScanTriggred {
    
    func scanButtonPressed() {
        guard checkScanPermissions(), !reader.isRunning else { return }
        
        reader.didFindCode = { result in
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(identifier: _vc_QRScanResultVC) as? QRScanResultViewController
            vc?.modalPresentationStyle = .overFullScreen
            vc?.delegateCustom = self
            self.present(vc!, animated: true, completion: nil)
            print("Completion with result: \(result.value) of type \(result.metadataType)")
        }
        
        reader.startScanning()
    }
}
