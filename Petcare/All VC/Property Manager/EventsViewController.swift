//
//  File.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 18/12/20.
//

import Foundation
import UIKit

class EventsViewController: UIViewController {

    /*************  UITableView  ************************/
    @IBOutlet weak var tableView: UITableView!
    
    /*************  UIButton  ************************/
    @IBOutlet weak var schedualEvents: UIButton!
    @IBOutlet weak var communityPrograme: UIButton!
    @IBOutlet weak var medicalAwareness: UIButton!
    
    /*************  reuseIdentifier  ************************/
    let reuseIdentifier = "EventsCell"
    
    /*************  UILabel  ************************/
    @IBOutlet weak var navigationText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        //EventsCell
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    @IBAction func schedulButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_SchedualEventsVC) as? SchedualEventsViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func cummunityButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_CommunityPrograVC) as? CommunityProgramViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func medicalAwareness(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_MedicalAwarenessVC) as? MedicalAwarenessProgramViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EventsCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
}
