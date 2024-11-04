//
//  PetConciergeSetupViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 14/12/20.
//

import UIKit
//import NohanaImagePicker
import Photos
import DropDown

class PetConciergeSetupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /*************  UILabel  ************************/
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var LabelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var navigationText: UILabel!
    
    /*************  UIButton  ************************/
    @IBOutlet weak var serviceButtonOne: UIButton!
    @IBOutlet weak var serviceButtonTwo: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    /*************  UIView  ************************/
    @IBOutlet weak var petcareLists: UIView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var propertyImageOne: UIImageView!
    @IBOutlet weak var propertyImageTwo: UIImageView!
    @IBOutlet weak var propertyImageThree: UIImageView!
    @IBOutlet weak var propertyImageDour: UIImageView!
    @IBOutlet weak var propertyImageFive: UIImageView!
    @IBOutlet weak var propertyImageSix: UIImageView!
    
    @IBOutlet weak var petServicesDropdown: UIView!
    @IBOutlet weak var petServicesLabel: UILabel!
    @IBOutlet weak var locationDropdown: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    
    var userType: String = ""
    var imagePicker: ImagePicker!
    var imageNumber:  Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.layer.cornerRadius = self.saveButton.layer.frame.height/2
        petcareLists.addBottomBorderWithColor(color: .lightGray, width: 0.5)
        locationView.addBottomBorderWithColor(color: .lightGray, width: 0.5)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.myviewTapped(_:)))
        propertyImageOne.isUserInteractionEnabled = true
        propertyImageOne.addGestureRecognizer(tapGestureRecognizer)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.myviewTapped1(_:)))
        propertyImageTwo.addGestureRecognizer(tap1)
        propertyImageTwo.isUserInteractionEnabled = true

        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.myviewTapped2(_:)))
        propertyImageThree.addGestureRecognizer(tap2)
        propertyImageThree.isUserInteractionEnabled = true

        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.myviewTapped3(_:)))
        propertyImageDour.addGestureRecognizer(tap3)
        propertyImageDour.isUserInteractionEnabled = true

        let tap4 = UITapGestureRecognizer(target: self, action: #selector(self.myviewTapped4(_:)))
        propertyImageFive.addGestureRecognizer(tap4)
        propertyImageFive.isUserInteractionEnabled = true

        let tap5 = UITapGestureRecognizer(target: self, action: #selector(self.myviewTapped5(_:)))
        propertyImageSix.addGestureRecognizer(tap5)
        propertyImageSix.isUserInteractionEnabled = true
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        self.petServicesDropdown.addGestureRecognizer(tap)
        
        let tapa = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped2(_:)))
        self.locationDropdown.addGestureRecognizer(tapa)
    }
    
    @objc func touchTapped(_ sender: UITapGestureRecognizer) {
        let dropDown = DropDown()
        dropDown.anchorView = self.petServicesDropdown
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        
        dropDown.arrowIndicationX =  .none
        dropDown.dataSource = ["Dog walking", "Pet Sitting", "Pet's Home", "Pet Adoption", "PetSmart Doggie"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            petServicesLabel.text = item
            petServicesLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @objc func touchTapped2(_ sender: UITapGestureRecognizer) {
        let dropDown = DropDown()
        dropDown.anchorView = self.locationDropdown
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        
        dropDown.arrowIndicationX =  .none
        dropDown.dataSource = ["NY", "California", "Chicago", "San Jose", "Sacramento", "San fransisco"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            locationLabel.text = item
            locationLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @IBAction func saveButtonPresssed(_ sender: UIButton) {
        if userType == "Pet Owners" {
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_TabBarVCPO) as? TabBarControllerPO
            self.navigationController?.pushViewController(vc!, animated: true)
        } else if userType == "Property Managers" {
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: nil).instantiateViewController(identifier: _vc_TabBarVC) as? TabBarController
            self.navigationController?.pushViewController(vc!, animated: true)
        } else if userType == "Pet Services Provider" {
            let vc = UIStoryboard.init(name: _storyboard_SP, bundle: nil).instantiateViewController(identifier: "TabBarControllerSP") as? TabBarControllerSP
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
        imageNumber = 0
        self.imagePicker.present(from: UIView())
    }
    @objc func myviewTapped1(_ sender: UITapGestureRecognizer) {
        imageNumber = 1
        self.imagePicker.present(from: UIView())
    }
    @objc func myviewTapped2(_ sender: UITapGestureRecognizer) {
        imageNumber = 2
        self.imagePicker.present(from: UIView())
    }
    @objc func myviewTapped3(_ sender: UITapGestureRecognizer) {
        imageNumber = 3
        self.imagePicker.present(from: UIView())
    }
    @objc func myviewTapped4(_ sender: UITapGestureRecognizer) {
        imageNumber = 4
        self.imagePicker.present(from: UIView())
    }
    @objc func myviewTapped5(_ sender: UITapGestureRecognizer) {
        imageNumber = 5
        self.imagePicker.present(from: UIView())
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension PetConciergeSetupViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        switch imageNumber {
        case 0:
            self.propertyImageOne.image = image
        case 1:
            self.propertyImageTwo.image = image
        case 2:
            self.propertyImageThree.image = image
        case 3:
            self.propertyImageDour.image = image
        case 4:
            self.propertyImageFive.image = image
        case 5:
            self.propertyImageSix.image = image
        default:
            break
        }
        
    }
}
extension UIView {
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}
