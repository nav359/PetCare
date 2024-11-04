//
//  SubscriptionPlanViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 07/12/20.
//

import UIKit

class SubscriptionPlanViewController: UIViewController {
    
    /*************  UILabel  ************************/
    @IBOutlet weak var navigationText: UILabel!

    var products = [Subscription]()
    
    var userType: String = ""
    
    /*************  UITableView  ************************/
    @IBOutlet weak var tableView: UITableView!
    
    let productCellId = "SubscriptionPlanTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: productCellId, bundle: nil), forCellReuseIdentifier: productCellId)
        for _ in 1...3 {
            var product = Subscription()
            product.id = "1"
            products.append(product)
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SubscriptionPlanViewController: UITableViewDelegate, UITableViewDataSource, CellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productCellId, for: indexPath) as! SubscriptionTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.backView.backgroundColor = hexStringToUIColor(hex: "fca903")
            cell.planType.text = "Monthly"
            cell.priceLabel.text = "$1.99"
        case 1:
            cell.backView.backgroundColor = hexStringToUIColor(hex: "e7143b")
            cell.planType.text = "Quaterly"
            cell.priceLabel.text = "$4.99"
        case 2:
            cell.backView.backgroundColor = hexStringToUIColor(hex: "57c0eb")
            cell.planType.text = "Yearly"
            cell.priceLabel.text = "$19.99"
        default:
            break
        }
        cell.cellDelegate = self
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        435
    }
    func subscribeButtonPressed() {
        if userType == "Pet Owners" {
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_TabBarVCPO) as? TabBarControllerPO
            self.navigationController?.pushViewController(vc!, animated: true)
        } else if userType == "Property Managers" {
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(withIdentifier: _vc_PetConciergeVC) as? PetConciergeSetupViewController
            vc?.userType = userType
            self.navigationController?.pushViewController(vc!, animated: true)
        } else if userType == "Pet Services Provider" {
            let vc = UIStoryboard.init(name: _storyboard_SP, bundle: nil).instantiateViewController(identifier: "TabBarControllerSP") as? TabBarControllerSP
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
