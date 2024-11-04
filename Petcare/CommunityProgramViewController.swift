//
//  CommunityProgramViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 17/12/20.
//

import UIKit

class CommunityProgramViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let margin: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let collectionView = collectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        // Do any additional setup after loading the view.
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
extension CommunityProgramViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CummunityProgramsViewCell", for: indexPath) as! CummunityProgramsViewCell
        cell.backView.layer.cornerRadius = 10
        cell.backView.layer.shadowColor = UIColor.gray.cgColor
        cell.backView.layer.shadowOffset = CGSize.zero
        cell.backView.layer.shadowOpacity = 1.0
        cell.backView.layer.shadowRadius = 7.0
        cell.backView.layer.masksToBounds =  false
        
        //cell.contentView.backgroundColor = GradientColor(.leftToRight, frame: view.frame, colors: self.cellRandomBackgroundColors())
        cell.contentView.layer.cornerRadius = 12.0
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 1.0
        cell.layer.masksToBounds = false
        cell.layer.cornerRadius = 3
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }
}
