//
//  PetConciergeViewControllerPO.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 22/12/20.
//

import UIKit

class PetConciergeViewControllerPO: UIViewController {
    
    @IBOutlet weak var scrollViewHeightConstrain: NSLayoutConstraint!
    @IBOutlet var bottamView: UIView!
    @IBOutlet var propertyManagerButon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottamView.layer.shadowOffset = CGSize(width: 0, height: -8)
        bottamView.layer.shadowColor = UIColor.black.cgColor
        bottamView.layer.shadowOpacity = 0.12
        bottamView.layer.shadowRadius = 10.0
        bottamView.layer.masksToBounds = false
        propertyManagerButon.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 12.5)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func petServiceProvider(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_PetServiceProvidersVC) as? PetServiceProvidersViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func gpsServices(_ sender: UIButton) {
        
    }
    
    @IBAction func bookAndSchedule(_ sender: UIButton) {
        
    }
}
