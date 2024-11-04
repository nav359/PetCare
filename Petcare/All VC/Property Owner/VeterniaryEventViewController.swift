//
//  VeterniaryEventViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 23/12/20.
//

import UIKit

class VeterniaryEventViewController: UIViewController {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var pageView: UIPageControl!
    
    @IBOutlet weak var expertCollectionView: UICollectionView!
    
    var imgArr = [UIImage(named:"7"), UIImage(named:"cat"), UIImage(named:"7"), UIImage(named:"cat")]
    
    var timer = Timer()
    
    var counter = 0
    
    var expertArray = [Expert]()
    
    let reuseIdentifier = "ExpertCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
        expertArray.append(Expert(id: "", name: "Emma Inshaan", image: "AdobeStock_299526692_Preview", type: "Grooming", experience: "5+ years of experience"))
        expertArray.append(Expert(id: "", name: "Ava Inshaan", image: "medical-3", type: "Boarding", experience: "5+ years of experience"))
        expertArray.append(Expert(id: "", name: "Sophia Inshaan", image: "beautiful-young-woman-with-red-cat-domestic-cat-scottish-fold-c", type: "Behaviour Training", experience: "10+ years of experience"))
        expertArray.append(Expert(id: "", name: "Amelia Inshaan", image: "AdobeStock_299526692_Preview", type: "Grooming", experience: "5+ years of experience"))
        expertArray.append(Expert(id: "", name: "Olivia Inshaan", image: "[", type: "Grooming", experience: "5+ years of experience"))
    }
    @objc func changeImage() {
         if counter < imgArr.count {
             let index = IndexPath.init(item: counter, section: 0)
             self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
             pageView.currentPage = counter
             counter += 1
         } else {
             counter = 0
             let index = IndexPath.init(item: counter, section: 0)
             self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
             pageView.currentPage = counter
             counter = 1
         }
     }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension VeterniaryEventViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.sliderCollectionView {
            return imgArr.count
        } else {
            return expertArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.sliderCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            if let vc = cell.viewWithTag(111) as? UIImageView {
                vc.image = imgArr[indexPath.row]
            }
            return cell
        } else if collectionView == self.expertCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ExpertCollectionViewCell
            cell.expertImage.image = UIImage(named: expertArray[indexPath.row].image)
            cell.expertname.text = expertArray[indexPath.row].name
            cell.positionType.text = expertArray[indexPath.row].type
            cell.expertExperience.text = expertArray[indexPath.row].experience
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
extension VeterniaryEventViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.sliderCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.sliderCollectionView {
            let size = sliderCollectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        } else {
            return CGSize(width: 110, height: 180)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.sliderCollectionView {
            return 0.0
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.sliderCollectionView {
            return 0.0
        } else {
            return 10
        }
    }
}
//extension VeterniaryEventViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExpertCollectionViewCell", for: indexPath) as! ExpertCollectionViewCell
//        return cell
//    }
//}
