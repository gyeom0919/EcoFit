//
//  ItemCollectionVC.swift
//  EcoFit
//
//  Created by 겸 on 2022/09/17.
//

import UIKit

class ItemCollectionVC: UIViewController {

    @IBOutlet weak var itemCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        itemCollection.delegate = self
        itemCollection.dataSource = self
        // Do any additional setup after loading the view.
    }
    

}

extension ItemCollectionVC : UICollectionViewDelegate {
    
    
}

extension ItemCollectionVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? UICollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
