//
//  RegistrationViewControllerPO.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 26/12/20.
//

import UIKit
import DropDown
import DatePicker
import SCLAlertView
import MobileCoreServices

class RegistrationViewControllerPO: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet weak var chooseBreed: UIView!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
   // @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet var robbiesIdTextFiedl: UITextField!
   // @IBOutlet var expireDateField: UITextField!
    @IBOutlet var microchipID: UITextField!
    @IBOutlet var cityregistration: UITextField!
    @IBOutlet var renewalDate: UITextField!
    @IBOutlet var dnaTested: UITextField!
    @IBOutlet var breedTest: UITextField!
    @IBOutlet var ownerName: UITextField!
    @IBOutlet var communityAddress: UITextField!
    @IBOutlet var streetAddress: UITextField!
    //@IBOutlet var city: DropDown!
    @IBOutlet var zip: UITextField!
    //@IBOutlet var state: DropDown!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var emailAddress: UITextField!
    @IBOutlet var uniqueCode: UITextField!
    @IBOutlet var orderTest: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var changeprofileImageBttn: UIButton!
    
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var chooseSex: UIView!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var chooseLabel: UIView!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var DOBView: UIView!
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var expireDate: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DOBView.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        nameTextField.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        chooseBreed.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        colorTextField.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        chooseSex.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        chooseLabel.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        weightTextField.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        lengthTextField.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        robbiesIdTextFiedl.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        expireDate.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        orderTest.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        
        microchipID.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        cityregistration.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        renewalDate.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        dnaTested.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        breedTest.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        ownerName.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        communityAddress.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        streetAddress.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        cityView.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        zip.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        stateView.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        phoneNumber.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        emailAddress.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        uniqueCode.addBottomBorderWithColorReg(color: UIColor.lightGray, width: 0.5)
        // Do any additional setup after loading the view.
        
        chooseBreed.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.breedDropdown(_:))))
        chooseBreed.isUserInteractionEnabled = true
        
        stateView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.stateDropdown(_:))))
        stateView.isUserInteractionEnabled = true
        
        cityView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.cityDropdown(_:))))
        cityView.isUserInteractionEnabled = true
        
        chooseSex.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.sexDropdown(_:))))
        chooseSex.isUserInteractionEnabled = true
        
        chooseLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.ageDropdown(_:))))
        chooseLabel.isUserInteractionEnabled = true
        
        DOBView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dobCalender(_:))))
        DOBView.isUserInteractionEnabled = true 
        
        expireDate.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.expireDateCalender(_:))))
        expireDate.isUserInteractionEnabled = true
    }
    @objc func dobCalender(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
            let picker = DatePicker()
            picker.setColors(main: hexStringToUIColor(hex: "#e7143b"), background: .white, inactive: hexStringToUIColor(hex: "#e7143b"))
            picker.setup(beginWith: Date()) { (selected, date) in
                if selected, let selectedDate = date {
                    self.dobLabel.text = selectedDate.string()
                    self.dobLabel.textColor = .black
                } else {
                    print("Cancelled")
                }
            }
            picker.show(in: self)
        
    }
    @objc func expireDateCalender(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
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
    @objc func ageDropdown(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = self.chooseLabel
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["00 Months", "02 Months", "04 Months", "06 Months","08 Months", "10 Months"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            ageLabel.text = item
            ageLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @objc func sexDropdown(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = self.chooseSex
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["Male", "Female"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            sexLabel.text = item
            sexLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @objc func cityDropdown(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = self.cityView
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["Alabama", "Alaska", "Arizona", "California", "Delaware", "Wisconsin", "Wyoming"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            cityLabel.text = item
            cityLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @objc func stateDropdown(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = self.stateView
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["Chicago", "Ny", "Cali", "Ohio", "Los Angles", "San diego", "San jose"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            stateLabel.text = item
            stateLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @objc func breedDropdown(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = self.chooseBreed
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["German Shepherd", "Golden Retriever", "Beagle", "Bulldog", "Yorkshire Terrier"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            breedLabel.text = item
            breedLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func editImageAction(_ sender: UIButton) {
        myprofile()
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
        
        profileImage.contentMode = .scaleAspectFill
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage]as! UIImage
        profileImage.image = selectedImage
        
        let imageData = selectedImage.jpegData(compressionQuality: 1.0)!
        let base64String =  imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        print(base64String)
        //   self.backImageEncodedString = base64String.replacingOccurrences(of: "\r\n", with: "")
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func attachDocument() {
        print("Hiii")
        let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet]
        let importMenu = UIDocumentPickerViewController(documentTypes: types as [String], in: .import)

        if #available(iOS 11.0, *) {
            importMenu.allowsMultipleSelection = true
        }

        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet

        present(importMenu, animated: true)
    }
    @IBAction func uploadVaccinationOne(_ sender: Any) {
        attachDocument()
    }
    @IBAction func uploadVaccinationtwo(_ sender: Any) {
        attachDocument()
    }
}
extension RegistrationViewControllerPO: UIDocumentPickerDelegate, UINavigationControllerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        //viewModel.attachDocuments(at: urls)
        print(urls)
        let alertView = SCLAlertView()
        alertView.showSuccess("Success!", subTitle: "The document has been uploaded successfully!")
    }

     func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
extension UIView {
    func addBottomBorderWithColorReg(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width-20, height: width)
        self.layer.addSublayer(border)
    }
}
