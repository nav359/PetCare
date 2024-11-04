//
//  VaccinationViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 17/12/20.
//

import UIKit

class VaccinationViewController: UIViewController {
    
    /*************  UILabel  ************************/
    @IBOutlet weak var navigationText: UILabel!
    
    /*************  UIView  ************************/
    @IBOutlet weak var firstUiview: UIView!
    @IBOutlet weak var secondUIView: UIView!
    @IBOutlet weak var thirdUIView: UIView!
    @IBOutlet weak var thirdUIview: UIView!
    
    /*************  UIImageView  ************************/
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImae: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    
    /*************  UIButton  ************************/
    @IBOutlet var schedualVaccButton: UIButton!
    @IBOutlet var schedualTestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        funcUi()
        
        schedualVaccButton.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 1.0, borderCornerRadius: 0)
        self.schedualVaccButton.layer.cornerRadius = self.schedualVaccButton.layer.frame.height/2
        
        schedualTestButton.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 1.0, borderCornerRadius: 0)
        self.schedualTestButton.layer.cornerRadius = self.schedualTestButton.layer.frame.height/2
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func schedualVaccination(_ sender: Any) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_SchedualVaccinationVC) as? SchedualVaccinationViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func schedualTest(_ sender: Any) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_SchedualTestVC) as? SchedualTestViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    func funcUi() {
        firstUiview.layer.cornerRadius = 10
        firstUiview.layer.shadowColor = UIColor.gray.cgColor
        firstUiview.layer.shadowOffset = CGSize.zero
        firstUiview.layer.shadowOpacity = 1.0
        firstUiview.layer.shadowRadius = 7.0
        firstUiview.layer.masksToBounds =  true
        
        secondUIView.layer.cornerRadius = 10
        secondUIView.layer.shadowColor = UIColor.gray.cgColor
        secondUIView.layer.shadowOffset = CGSize.zero
        secondUIView.layer.shadowOpacity = 1.0
        secondUIView.layer.shadowRadius = 7.0
        secondUIView.layer.masksToBounds =  true
        
        thirdUIView.layer.cornerRadius = 10
        thirdUIView.layer.shadowColor = UIColor.gray.cgColor
        thirdUIView.layer.shadowOffset = CGSize.zero
        thirdUIView.layer.shadowOpacity = 1.0
        thirdUIView.layer.shadowRadius = 7.0
        thirdUIView.layer.masksToBounds =  true
        
        thirdUIview.layer.cornerRadius = 10
        thirdUIview.layer.shadowColor = UIColor.gray.cgColor
        thirdUIview.layer.shadowOffset = CGSize.zero
        thirdUIview.layer.shadowOpacity = 1.0
        thirdUIview.layer.shadowRadius = 7.0
        thirdUIview.layer.masksToBounds =  true
    }
}
