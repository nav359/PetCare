//
//  PetContestViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 18/12/20.
//

import UIKit
import ZZImageSlider

class PetContestViewController: UIViewController {

    @IBOutlet weak var vSlider: ZZImageSlider!
    @IBOutlet weak var participateButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pricesFromSponsers: UIButton!
    @IBOutlet weak var freeButton: UIButton!
    @IBOutlet weak var viewProfileButton: UIButton!
    @IBOutlet weak var petImagesSlider: UICollectionView!
    
    var PetContestArray = [PetContest]()
    
    let reuseIdentifier = "PetContestCollectionViewCell"
    
    let items: [ZZSliderItem] = [
            UIImageSliderItem(image: UIImage(named: "Border-Collie-UK-1-977x1024")!, text: ""),
            BundleSliderItem(imageName: "4fc32d5f568d5b69c37c6a9ded53613a", text: ""),
            BundleSliderItem(imageName: "Border-Collie-UK-1-977x1024", text: ""),
            BundleSliderItem(imageName: "dog-at-vets", text: ""),
            BundleSliderItem(imageName: "4fc32d5f568d5b69c37c6a9ded53613a", text: ""),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vSlider.delegate = self
        vSlider.alpha = 1
        vSlider.items = items
        PetContestArray.append(PetContest(id: "1", image: "animals-dogs-puppies-9111", title: "Charlie"))
        PetContestArray.append(PetContest(id: "1", image: "b783ca574a19fe4d11614253ce9559d6", title: "Hoosh"))
        PetContestArray.append(PetContest(id: "1", image: "image-11-370x240", title: "German Dog"))
        PetContestArray.append(PetContest(id: "1", image: "kissclipart-clip-809c246ff2850ae5", title: "Dil"))
        let hConfs: ZZSliderConfigs = {
                    var confs = ZZSliderConfigs()
                    confs.sliderAxis = .horizontal
                    confs.items.edgeInsets.left = 16
                    confs.items.edgeInsets.right = -16
                    confs.items.cornerRadius = 20
                    confs.items.sizePercent = 0.1
                    confs.items.selectionStyle = .none
                    confs.imageView.font = UIFont.systemFont(ofSize: 25, weight: .bold)
                    confs.imageView.textBackgroundStyle = .gradient(colors: [
                        UIColor.black.withAlphaComponent(0),
                        UIColor.black.withAlphaComponent(0.7)
                    ])
                    return confs
                }()
        vSlider.configs = hConfs
        
        
        self.participateButton.layer.cornerRadius = self.participateButton.frame.height/2
        self.pricesFromSponsers.layer.cornerRadius = self.pricesFromSponsers.frame.height/2
        self.freeButton.layer.cornerRadius = self.freeButton.frame.height/2
        self.viewProfileButton.layer.cornerRadius = self.viewProfileButton.frame.height/2
        self.viewProfileButton.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 1.0, borderCornerRadius: self.viewProfileButton.frame.height/2)
        //collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func participateButtonAction(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_BeAParticipantVC) as? BeAParticipantViewControllerPO
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func sponsersButton(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_BeASponserVC) as? BeASponserViewControllerPO
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension PetContestViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PetContestArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PetContestCollectionViewCell
            cell.petLabel.text = PetContestArray[indexPath.row].title
            cell.petImage.image = UIImage(named: PetContestArray[indexPath.row].image)
            return cell
    }
}
extension PetContestViewController: ZZImageSliderDelegate {
    func didSlideTo(item: ZZSliderItem, index: Int) {
        print("-> ", index)
    }
    
    func didSelectSlide(item: ZZSliderItem, index: Int) {
        print("didSelectSlide: ", index)
    }
}
