//
//  SchedualVaccinationViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 17/12/20.
//

import UIKit
import DropDown
import DatePicker

class SchedualVaccinationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    /*************  UILabel  ************************/
    @IBOutlet weak var navigationText: UILabel!
    
    /*************  UIView  ************************/
    @IBOutlet var vaccinationName: UIView!
    @IBOutlet var locationView: UIView!
    @IBOutlet var servicesView: UIView!
    @IBOutlet var imageView: UIView!
    @IBOutlet var dateView: UIView!
    @IBOutlet var timeView: UIView!
    @IBOutlet var chargesView: UIView!
    @IBOutlet var otherDetails: UIView!
    
    /*************  UITextField  ************************/
    @IBOutlet weak var vaccinationNameText: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var charges: UITextField!
    @IBOutlet weak var otherDetailsText: UITextField!
    
    /*************  UIButton  ************************/
    @IBOutlet var schedualButton: UIButton!
    @IBOutlet var chooseButton: UIButton!
    
    @IBOutlet weak var servicesDropdown: UIView!
    @IBOutlet weak var servicesLabel: UILabel!
    
    @IBOutlet weak var imageButton: UIView!
    
    @IBOutlet weak var dateDropdown: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeDropdown: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorder()
        self.chooseButton.layer.cornerRadius = self.chooseButton.frame.height/2
        self.schedualButton.layer.cornerRadius = self.schedualButton.frame.height/2
        
        servicesDropdown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.servicesDrop(_:))))
        servicesDropdown.isUserInteractionEnabled = true
        
        imageButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.uploadImage(_:))))
        imageButton.isUserInteractionEnabled = true
        
        dateDropdown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dateAction(_:))))
        dateDropdown.isUserInteractionEnabled = true
        
        timeDropdown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.TimeAction(_:))))
        timeDropdown.isUserInteractionEnabled = true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func chooseFile(_ sender: Any) {
        myprofile()
    }
    @objc func TimeAction(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        
    }
    @objc func dateAction(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        showDate()
    }
    @objc func uploadImage(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        myprofile() 
    }
    private func showDate() {
        let picker = DatePicker()
        picker.setColors(main: hexStringToUIColor(hex: "#e7143b"), background: .white, inactive: hexStringToUIColor(hex: "#e7143b"))
        picker.setup(beginWith: Date()) { (selected, date) in
            if selected, let selectedDate = date {
                self.dateLabel.text = selectedDate.string()
                self.dateLabel.textColor = .black
            } else {
                print("Cancelled")
            }
        }
        picker.show(in: self)
    }
    func myprofile() {
        
        imagePicker.delegate = self
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func openGallary() {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
       // profileImage.contentMode = .scaleAspectFill
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage]as! UIImage
        //profileImage.image = selectedImage
        
        let imageData = selectedImage.jpegData(compressionQuality: 1.0)!
        let base64String =  imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        print(base64String)
        //   self.backImageEncodedString = base64String.replacingOccurrences(of: "\r\n", with: "")
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    @objc func servicesDrop(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = self.servicesDropdown
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["Test 1", "Test 02", "Test 03", "Test 04", "Test 05"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            servicesLabel.text = item
            servicesLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @IBAction func chooseFileButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func addBorder() {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: vaccinationName.frame.size.height-1, width: vaccinationName.frame.width-20, height: 1.0)
        bottomBorder.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        vaccinationName.layer.addSublayer(bottomBorder)
        
        let bottomBorderA = CALayer()
        bottomBorderA.frame = CGRect(x: 0.0, y: locationView.frame.size.height-1, width: locationView.frame.width-20, height: 1.0)
        bottomBorderA.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        locationView.layer.addSublayer(bottomBorderA)
        
        let bottomBorderB = CALayer()
        bottomBorderB.frame = CGRect(x: 0.0, y: servicesView.frame.size.height-1, width: servicesView.frame.width-20, height: 1.0)
        bottomBorderB.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        servicesView.layer.addSublayer(bottomBorderB)
        
        let bottomBorderC = CALayer()
        bottomBorderC.frame = CGRect(x: 0.0, y: imageView.frame.size.height-1, width: imageView.frame.width-20, height: 1.0)
        bottomBorderC.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageView.layer.addSublayer(bottomBorderC)
        
        let bottomBorderD = CALayer()
        bottomBorderD.frame = CGRect(x: 0.0, y: dateView.frame.size.height-1, width: dateView.frame.width-20, height: 1.0)
        bottomBorderD.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        dateView.layer.addSublayer(bottomBorderD)
        
        let bottomBorderE = CALayer()
        bottomBorderE.frame = CGRect(x: 0.0, y: timeView.frame.size.height-1, width: timeView.frame.width-20, height: 1.0)
        bottomBorderE.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        timeView.layer.addSublayer(bottomBorderE)
        
        let bottomBorderF = CALayer()
        bottomBorderF.frame = CGRect(x: 0.0, y: chargesView.frame.size.height-1, width: chargesView.frame.width-20, height: 1.0)
        bottomBorderF.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        chargesView.layer.addSublayer(bottomBorderF)
        
        let bottomBorderG = CALayer()
        bottomBorderG.frame = CGRect(x: 0.0, y: otherDetails.frame.size.height-1, width: otherDetails.frame.width-20, height: 1.0)
        bottomBorderG.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        otherDetails.layer.addSublayer(bottomBorderG)
    }
}
