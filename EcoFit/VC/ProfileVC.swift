//
//  ProfileVC.swift
//  EcoFit
//
//  Created by 겸 on 2022/09/18.
//

import UIKit

class ProfileVC: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var itemView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

        // Do any additional setup after loading the view.
    }
    


}

extension ProfileVC {
    
    func setUI(){
        configureProfileImg()
        configureItemView()
    }
    
    func configureProfileImg(){
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }
    
    func configureItemView(){
        itemView.layer.cornerRadius = 8
    }
}
