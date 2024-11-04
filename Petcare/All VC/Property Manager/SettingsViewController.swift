//
//  SettingsViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 19/12/20.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var SettingArray = [Settings]()
    
    let reuseIdentifier = "SettingsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingArray.append(Settings(id: "1", title: "Contact Us"))
        SettingArray.append(Settings(id: "1", title: "Change Password"))
        SettingArray.append(Settings(id: "1", title: "Notification"))
        tableView.separatorStyle = .none
        
        
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func ediButtonPressed(_ sender: UIButton) {
//        let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_EditProfileVC) as? EditProfileViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func logoutButtonPressedd(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: _storyboard_main, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.isModalInPresentation = true
        self.present(newViewController, animated: true, completion: nil)
    }
}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsTableViewCell
        cell.title.text = SettingArray[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(withIdentifier: _vc_ContactUsVC) as? ContactUsViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case 1:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(withIdentifier: _vc_ChangePasswordVC) as? ChangePasswordViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case 2:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(withIdentifier: _vc_NotificationVC) as? NotificationViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        default:
            break
        }
    }
}