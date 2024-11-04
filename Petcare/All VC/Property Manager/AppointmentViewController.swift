//
//  AppointmentViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 17/12/20.
//

import UIKit

class AppointmentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var AppointmentListArray = [Appointment]()
    
    let reuseIdentifier = "AppointmentTableViewCell"
    @IBOutlet weak var backButtonOutletPM: UIButton!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    var checkNavbar: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppointmentListArray.append(Appointment(id: "1", date: "Sept 18", image: "", title: "Hugh Jackman", description: "There are already many answers posts over here for attributed text and If you want to put BackgroundImage for UIButton"))
        AppointmentListArray.append(Appointment(id: "1", date: "Octb 18", image: "", title: "Nimo Jackman", description: "There are already many answers posts over here for attributed text and If you want to put BackgroundImage for UIButton"))
        AppointmentListArray.append(Appointment(id: "1", date: "Nove 30", image: "", title: "There Jackman", description: "There are already many answers posts over here for attributed text and If you want to put BackgroundImage for UIButton"))
        AppointmentListArray.append(Appointment(id: "1", date: "Jan 18", image: "", title: "Nav Jackman", description: "There are already many answers posts over here for attributed text and If you want to put BackgroundImage for UIButton"))
        AppointmentListArray.append(Appointment(id: "1", date: "Feb 31", image: "", title: "Demo Text", description: "There are already many answers posts over here for attributed text and If you want to put BackgroundImage for UIButton"))
        AppointmentListArray.append(Appointment(id: "1", date: "July 25", image: "", title: "Hugh Jackman", description: "There are already many answers posts over here for attributed text and If you want to put BackgroundImage for UIButton"))
        tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.clear

        if checkNavbar {
            backButtonOutletPM.isHidden = false
        }
        
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}
extension AppointmentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppointmentListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AppointmentTableViewCell
        cell.backView.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.backView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.backView.layer.shadowOpacity = 1
        cell.backView.layer.shadowRadius = 5
        cell.backView.layer.masksToBounds = false
        cell.backView.layer.cornerRadius = 5
        cell.date.text = AppointmentListArray[indexPath.row].date
        cell.custImage.layer.cornerRadius = cell.custImage.layer.frame.width/2
        cell.title.text = AppointmentListArray[indexPath.row].title
        cell.descriptionLabel.text = AppointmentListArray[indexPath.row].description
        cell.backgroundColor = UIColor.clear
        //cell.custImage.image = UIImage(named: AppointmentListArray[indexPath.row].image)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_ClientProfileVC) as? ClientProfileViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
