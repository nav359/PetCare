//
//  BeSponserViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 18/12/20.
//
import UIKit
import DropDown

class BeAParticipantViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //Rounded Views
    @IBOutlet weak var imageTopView: UIView!
    //@IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    //Textfields
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet weak var chooseBreed: UIButton!
    @IBOutlet weak var pickGender: UIButton!
    @IBOutlet weak var pickAge: UIButton!
    @IBOutlet weak var pickWeight: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageTopView.layer.cornerRadius = imageTopView.layer.frame.height/2
        profileImage.layer.cornerRadius = profileImage.layer.frame.height/2
        cameraView.layer.cornerRadius = cameraView.layer.frame.height/2
        submitButton.layer.cornerRadius = submitButton.layer.frame.height/2
        
        nameTextField.addLine(position: .bottom, color: UIColor.white, width: 0.8)
        chooseBreed.addLine(position: .bottom, color: UIColor.white, width: 0.8)
        pickGender.addLine(position: .bottom, color: UIColor.white, width: 0.8)
        pickAge.addLine(position: .bottom, color: UIColor.white, width: 0.8)
        pickWeight.addLine(position: .bottom, color: UIColor.white, width: 0.8)
        nameTextField.text = ""
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        cameraView.addGestureRecognizer(tap)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGestureRecognizer)
        
        chooseBreed.addTarget(self, action: #selector(chooseBreedAction), for: .touchUpInside)
        
        pickGender.addTarget(self, action: #selector(chooseGenderDropdown), for: .touchUpInside)
        
        pickAge.addTarget(self, action: #selector(chooseAgeDropdown), for: .touchUpInside)
        
        pickWeight.addTarget(self, action: #selector(chooseWeightDropdown), for: .touchUpInside)
    }
    @objc func chooseBreedAction(sender: UIButton!) {
        self.chooseBreedDropdown()
    }
    func chooseBreedDropdown() {
        let dropDown = DropDown()
        dropDown.anchorView = self.chooseBreed
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        
        dropDown.arrowIndicationX =  .none
        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            chooseBreed.setTitle(item, for: .normal)
            chooseBreed.setTitleColor(.white, for: .normal)
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @objc func chooseGenderDropdown() {
        let dropDown = DropDown()
        dropDown.anchorView = self.pickGender
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["Male", "Female", "Other"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            pickGender.setTitle(item, for: .normal)
            pickGender.setTitleColor(.white, for: .normal)
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @objc func chooseAgeDropdown() {
        let dropDown = DropDown()
        dropDown.anchorView = self.pickAge
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        
        dropDown.arrowIndicationX =  .none
        dropDown.dataSource = ["01 Months", "02 Months", "03 Months", "04 Months", "05 Months", "06 Months", "07 Months", "08 Months", "09 Months"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            pickAge.setTitle(item, for: .normal)
            pickAge.setTitleColor(.white, for: .normal)
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @objc func chooseWeightDropdown() {
        let dropDown = DropDown()
        dropDown.anchorView = self.pickWeight
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        
        dropDown.arrowIndicationX =  .none
        dropDown.dataSource = ["02 Kg", "04 Kg", "06 Kg", "8 Kg", "10 Kg", "12 Kg", "14 Kg", "15 Kg", "16 Kg"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            pickWeight.setTitle(item, for: .normal)
            pickWeight.setTitleColor(.white, for: .normal)
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        myprofile()
    }
    @objc func handleGesture(gesture: UITapGestureRecognizer) -> Void {
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
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
