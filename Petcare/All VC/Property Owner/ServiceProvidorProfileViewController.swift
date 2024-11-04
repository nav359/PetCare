//
//  ServiceProvidorProfileViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 22/12/20.
//

import UIKit

class ServiceProvidorProfileViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var serviceProviderServices = [ServiceProvidersServices]()
    
    let reuseIdentifier = "ServiceProviderCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceProviderServices.append(ServiceProvidersServices(id: "1", name: "Service 1", image: "]", description: ""))
        serviceProviderServices.append(ServiceProvidersServices(id: "1", name: "Service 2", image: "abond1", description: ""))
        serviceProviderServices.append(ServiceProvidersServices(id: "1", name: "Service 3", image: "]", description: ""))
        serviceProviderServices.append(ServiceProvidersServices(id: "1", name: "Service 4", image: "abond1", description: ""))
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension ServiceProvidorProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        serviceProviderServices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ServiceProviderCollectionViewCell
        cell.imageview.image = UIImage(named: serviceProviderServices[indexPath.row].image)
        cell.label.text = serviceProviderServices[indexPath.row].name
        return cell
    }
}
