//
//  ClientListViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 15/12/20.
//

import UIKit

class ClientListViewController: UIViewController {

    /*************  Data Array  ************************/
    var ClientListArray = [ClientList]()
    
    /*************  UITableView  ************************/
    @IBOutlet var tableView: UITableView!
    
    /*************  UILabel  ************************/
    @IBOutlet weak var navigationText: UILabel!
    
    /*************  reuseIdentifier  ************************/
    let reuseIdentifier = "ClientListTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        ClientListArray.append(ClientList(id: "1", name: "Jack Ryan", image: ""))
        ClientListArray.append(ClientList(id: "1", name: "Mason Davis", image: ""))
        ClientListArray.append(ClientList(id: "1", name: "Elijah Smith", image: ""))
        ClientListArray.append(ClientList(id: "1", name: "Jack Jones", image: ""))
        ClientListArray.append(ClientList(id: "1", name: "Oliver Davis", image: ""))
        ClientListArray.append(ClientList(id: "1", name: "Lucas Smith", image: ""))
        ClientListArray.append(ClientList(id: "1", name: "Michael Jones", image: ""))
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension ClientListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ClientListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ClientListTableViewCell
        cell.clientname.text = ClientListArray[indexPath.row].name
        cell.clientImage.layer.cornerRadius = cell.clientImage.layer.frame.width/2
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_ClientProfileVC) as? ClientProfileViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
