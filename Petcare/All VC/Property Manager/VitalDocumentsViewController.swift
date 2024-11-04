//
//  VitalDocumentsViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 18/12/20.
//

import UIKit

class VitalDocumentsViewController: UIViewController {
    
    /*************  data array  ************************/
    var VitalDocumentsArray = [VitalDocuments]()
    
    /*************  UILabel  ************************/
    @IBOutlet weak var navigationText: UILabel!
    
    /*************  UIButton  ************************/
    @IBOutlet weak var uploadDocumenst: UIButton!
    @IBOutlet weak var addDocuments: UIButton!
    
    /*************  UICollectionView  ************************/
    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "VitalDocumentsCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        VitalDocumentsArray.append(VitalDocuments(id: "1", title: "Vaccination Records"))
        VitalDocumentsArray.append(VitalDocuments(id: "1", title: "Medical Documents"))
        VitalDocumentsArray.append(VitalDocuments(id: "1", title: "City Registration"))
        VitalDocumentsArray.append(VitalDocuments(id: "1", title: "Service Animal Certificate"))
        VitalDocumentsArray.append(VitalDocuments(id: "1", title: "Microchip Identification"))
        VitalDocumentsArray.append(VitalDocuments(id: "1", title: "Proof of Insurance"))
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let sizeCollection = CGSize(width: (view.frame.size.width/2.2), height: (view.frame.size.width/1.9))
        flowLayout.itemSize = sizeCollection
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        //Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        //Register the xib for collection view cell
        self.collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout();
    }
}
extension VitalDocumentsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        VitalDocumentsArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VitalDocumentsCollectionViewCell
        cell.title.text =  VitalDocumentsArray[indexPath.row].title
        cell.backView.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.backView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.backView.layer.shadowOpacity = 0.5
        cell.backView.layer.shadowRadius = 5
        cell.backView.layer.masksToBounds = false
        cell.backView.layer.cornerRadius = 25
        cell.backView.backgroundColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
