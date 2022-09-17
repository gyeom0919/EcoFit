//
//  ItemCollectionVC.swift
//  EcoFit
//
//  Created by 겸 on 2022/09/17.
//

import UIKit

class ItemCollectionVC: UIViewController {

    @IBOutlet weak var itemCollection: UICollectionView!
    
    var arrayImageName : [String] = ["오래가는 단단한 리유저블백","빛나는 스테인리스 빨때와 텀블러","북극곰 집 지키기 팔찌","생분해플라스틱 팔찌","온실가스 흡수 목걸이","미세 플라스틱 제거 목걸이"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        itemCollection.delegate = self
        itemCollection.dataSource = self
        // Do any additional setup after loading the view.
//        self.itemCollection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    

}

extension ItemCollectionVC : UICollectionViewDelegate {
    
    
}

extension ItemCollectionVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImageName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GridCollectionViewCell
        
//        cell.backgroundColor = UIColor.orange
        //셀 가장자리
        cell.layer.cornerRadius = 8
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor(red: 0.883, green: 0.861, blue: 0.861, alpha: 1).cgColor
        
        cell.storeImage.image = UIImage(named: arrayImageName[indexPath.row]) ?? UIImage()
        return cell
    }
    
    
    
}

extension ItemCollectionVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((itemCollection.frame.width - 30) / 2)
        print("cell width : \(width)")
        return CGSize(width: width, height: width - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
