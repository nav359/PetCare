//
//  BuyProductsViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 25/12/20.
//

import UIKit

class BuyProductsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var data = [BuyProduct]()
    
    let reuseIdentifier = "BuyProductTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.append(BuyProduct(id: "", name: "Convallis Quam Candy", image: "Shop-1", discountedPrice: "$1000", sellingPrice: "$300", ratings: "2"))
        data.append(BuyProduct(id: "", name: "Pepper", image: "Shop-2", discountedPrice: "$1200", sellingPrice: "$900", ratings: "5"))
        data.append(BuyProduct(id: "", name: "Peanut Taco Candy", image: "Shop-3", discountedPrice: "$1300", sellingPrice: "$500", ratings: "1"))
        data.append(BuyProduct(id: "", name: "Pickles Quam Biscuit", image: "Shop-4", discountedPrice: "$1400", sellingPrice: "$400", ratings: "4"))

        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    @IBAction func cartButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_ShoppingCartVC) as? ShoppingCartViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension BuyProductsViewController: UITableViewDataSource, UITableViewDelegate, BuyDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! BuyProductTableViewCell
        cell.productName.text = data[indexPath.row].name
        cell.discountedPrice.text = data[indexPath.row].discountedPrice
        cell.sellingPrice.text = data[indexPath.row].sellingPrice
        cell.productImage.image = UIImage(named: data[indexPath.row].image)
        cell.BuyDelegate = self
        if let doubleValue =  Double(data[indexPath.row].ratings) {
            cell.ratingView.rating = doubleValue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        135
    }
    
    func triggerBuyNow() {
        let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_ShoppingCartVC) as? ShoppingCartViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
