//
//  PetServiceProvidersViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 22/12/20.
//

import UIKit

class PetServiceProvidersViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var ServiceProvidersArray = [ServiceProviders]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceProvidersArray.append(ServiceProviders(id: "1", name: "Jack Howkman", image: "", description: "Pet Concierge Community Concierge Pet Services Providers (Approved by the propeny manager) Property manager > Customized Concierge GPS Related Services (GEO sync location"))
        ServiceProvidersArray.append(ServiceProviders(id: "1", name: "Mosh Howkman", image: "", description: "Pet Concierge Community Concierge Pet Services Providers (Approved by the propeny manager) Property manager > Customized Concierge GPS Related Services (GEO sync location"))
        ServiceProvidersArray.append(ServiceProviders(id: "1", name: "Monas Howkman", image: "", description: "Pet Concierge Community Concierge Pet Services Providers (Approved by the propeny manager) Property manager > Customized Concierge GPS Related Services (GEO sync location"))
        ServiceProvidersArray.append(ServiceProviders(id: "1", name: "Deck Howkman", image: "", description: "Pet Concierge Community Concierge Pet Services Providers (Approved by the propeny manager) Property manager > Customized Concierge GPS Related Services (GEO sync location"))
        ServiceProvidersArray.append(ServiceProviders(id: "1", name: "Peter Handsome", image: "", description: "Pet Concierge Community Concierge Pet Services Providers (Approved by the propeny manager) Property manager > Customized Concierge GPS Related Services (GEO sync location"))
        ServiceProvidersArray.append(ServiceProviders(id: "1", name: "Trigger Inshaan", image: "", description: "Pet Concierge Community Concierge Pet Services Providers (Approved by the propeny manager) Property manager > Customized Concierge GPS Related Services (GEO sync location"))
        ServiceProvidersArray.append(ServiceProviders(id: "1", name: "Man Howkman", image: "", description: "Pet Concierge Community Concierge Pet Services Providers (Approved by the propeny manager) Property manager > Customized Concierge GPS Related Services (GEO sync location"))
        ServiceProvidersArray.append(ServiceProviders(id: "1", name: "Related Howkman", image: "", description: "Pet Concierge Community Concierge Pet Services Providers (Approved by the propeny manager) Property manager > Customized Concierge GPS Related Services (GEO sync location"))
        ServiceProvidersArray.append(ServiceProviders(id: "1", name: "Jack Howkman", image: "", description: "Pet Concierge Community Concierge Pet Services Providers (Approved by the propeny manager) Property manager > Customized Concierge GPS Related Services (GEO sync location"))
        
        let cellNib = UINib(nibName: "ServiceProviderTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "ServiceProviderTableViewCell")
        
        self.tableView.rowHeight = 105
        self.tableView.estimatedRowHeight = 105
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension PetServiceProvidersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ServiceProvidersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceProviderTableViewCell", for: indexPath) as! ServiceProviderTableViewCell
        cell.nameLabel.text = ServiceProvidersArray[indexPath.row].name
        cell.descriptionLabel.text = ServiceProvidersArray[indexPath.row].description
        cell.reload()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_ServiceProvidorProfileVC) as? ServiceProvidorProfileViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
