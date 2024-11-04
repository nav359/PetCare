//
//  ShoppingCartViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 25/12/20.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var priceButton: UIButton!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var placeOrderButton: UIButton!
    
    let reuseIdentifier = "ShoppingTableViewCell"
    
    var data = [BuyProduct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        changeButton.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 16.5)
        priceButton.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 1.0, borderCornerRadius: 25)
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension ShoppingCartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ShoppingTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
}
