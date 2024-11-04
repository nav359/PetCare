//
//  File.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import Foundation
import UIKit

class ClientProfileViewControllerSP: UIViewController {

    @IBOutlet weak var profileUIView: UIView!
    @IBOutlet weak var petDetails: UIView!
    @IBOutlet weak var petReports: UIView!
    @IBOutlet weak var petDocuments: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileUIView.layer.cornerRadius = profileUIView.layer.frame.width/2
        profileUIView.layer.masksToBounds = false
        
        petDetails.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tap(_:))))
        petDetails.isUserInteractionEnabled = true
        petReports.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tap(_:))))
        petReports.isUserInteractionEnabled = true
        petDocuments.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tap(_:))))
        petDocuments.isUserInteractionEnabled = true
    }
    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
            let tag = gestureRecognizer.view?.tag
            switch tag! {
            case 1 :
                let vc = UIStoryboard.init(name: _storyboard_SP, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetDetailsVC) as? PetDetailsViewControllerSP
                self.navigationController?.pushViewController(vc!, animated: true)
            case 2 :
                print("select second view")
            case 3 :
                print("select third view")
            default:
                print("default")
            }
        }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
