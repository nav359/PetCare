//
//  QRScanResultViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 23/12/20.
//

import UIKit

protocol ScanTriggred {
    func scanButtonPressed()
}

class QRScanResultViewController: UIViewController {

    var delegateCustom : ScanTriggred?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        delegateCustom?.scanButtonPressed()
    }
    
    @IBAction func scanButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        delegateCustom?.scanButtonPressed()
    }
    
    @IBAction func gpsTrackingAction(_ sender: UIButton) {
        
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_GPSTrackingVC) as? GPSTrackingViewController
            self.navigationController?.pushViewController(vc!, animated: true)
    }
    //    @IBAction func gpsTrackingButtonPressed(_ sender: UIButton) {
//        let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_GPSTrackingVC) as? GPSTrackingViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
//    }
    
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        let text = "494894949497788"
        let text2 = "23/12/2020"
        let textShare = [text, text2]
        let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}
