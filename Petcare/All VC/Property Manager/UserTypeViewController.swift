//
//  UserTypeViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 07/12/20.
//

import UIKit

class UserTypeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var contentArray : [UserType] = [UserType]()
    
    let reuseIdentifier = "UserTypeTableViewCell"
    
    @IBOutlet weak var selectUserType: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentArray.append(UserType(id: "1", imageName: "pet_owner", title: "Pet Owners", selectedImage: "pet_owner_active"))
        self.contentArray.append(UserType(id: "2", imageName: "pet_service_provider", title: "Pet Services Provider", selectedImage: "pet_service_provider_active"))
        self.contentArray.append(UserType(id: "3", imageName: "property_manager", title: "Property Managers", selectedImage: "property_manager_active"))
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        
        
        tableView.register(UINib.init(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(withIdentifier: _vc_LoginVC) as? LoginViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
extension UserTypeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserTypeTableViewCell
        cell.typeImageView.image = UIImage(named: contentArray[indexPath.row].imageName)
        cell.typeTitle.text = contentArray[indexPath.row].title
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? UserTypeTableViewCell {
            cell.typeImageView.image = UIImage(named: contentArray[indexPath.row].selectedImage)
            cell.typeTitle.textColor = hexStringToUIColor(hex: "#e7143b")
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: nil).instantiateViewController(withIdentifier: _vc_LoginVC) as? LoginViewController
            vc?.userType = contentArray[indexPath.row].title
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? UserTypeTableViewCell {
            cell.imageView?.layer.borderColor = UIColor.clear.cgColor
            cell.imageView?.layer.borderWidth = 0
            cell.imageView?.layer.masksToBounds = true
        }
    }
}
