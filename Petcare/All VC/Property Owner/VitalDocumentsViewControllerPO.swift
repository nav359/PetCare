//
//  File.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 22/12/20.
//

import UIKit

class VitalDocumentsViewControllerPO: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var VitalDocumentsArray = [VitalDocuments]()
    
    let reuseIdentifier = "VitalDocumentsCollectionViewCellPO"
    
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
        
        //self.collectionView.register(DocFooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter , withReuseIdentifier: "DocFooterCollectionReusableView")
        
        //collectionView.register(UINib.init(nibName: "DocFooterCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "DocFooterCollectionReusableView")
        let id = "DocFooterCollectionReusableView"
        collectionView.register(UINib(nibName: id, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: id)
        //collectionView.register(DocFooterCollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "DocFooterCollectionReusableView")
        
        print("Hello")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension VitalDocumentsViewControllerPO: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        VitalDocumentsArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VitalDocumentsCollectionViewCellPO
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 0)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footerView: DocFooterCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DocFooterCollectionReusableView", for: indexPath) as! DocFooterCollectionReusableView
        
        return footerView
    }
}
