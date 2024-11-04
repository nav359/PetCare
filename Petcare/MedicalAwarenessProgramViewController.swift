//
//  MedicalAwarenessProgramViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 17/12/20.
//

import UIKit

class MedicalAwarenessProgramViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var MedicalAwarenessArray = [MedicalAwareness]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-1", title: "Veterinary Services"))
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-2", title: "Small Pets Care"))
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-3", title: "Vaccines"))
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-4", title: "Dental Treatments"))
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-5", title: "Physiotherapy"))
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-6", title: "Veterinary Services "))
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let sizeCollection = CGSize(width: (view.frame.size.width/2.2), height: (view.frame.size.width/1.9))
        flowLayout.itemSize = sizeCollection
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        //Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        //Register the xib for collection view cell
        let cellNib = UINib(nibName: "MedicalAwarenessCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "MedicalAwarenessCollectionViewCell")
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func schedulButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SchedualTestViewController") as? SchedualTestViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func cummunityButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "CommunityProgramViewController") as? CommunityProgramViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func medicalAwareness(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "MedicalAwarenessProgramViewController") as? MedicalAwarenessProgramViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout();
    }
}
extension MedicalAwarenessProgramViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MedicalAwarenessArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MedicalAwarenessCollectionViewCell", for: indexPath) as! MedicalAwarenessCollectionViewCell
        cell.mainImage.image =  UIImage(named: MedicalAwarenessArray[indexPath.row].image)
        cell.mainTitle.text = MedicalAwarenessArray[indexPath.row].title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
