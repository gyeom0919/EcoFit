//
//  ProfileVC.swift
//  EcoFit
//
//  Created by 겸 on 2022/09/18.
//

import UIKit

class ProfileVC: UIViewController {

    let cellSpacingHeight : CGFloat = 1

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var settingTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        settingTable.dataSource = self
        settingTable.delegate = self

        settingTable.separatorStyle = .none
        
        // Do any additional setup after loading the view.
    }
    
    var settingItems = ["환경혜택 인증목록", "나의 장비", "회원정보"]
    


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

extension ProfileVC : UITableViewDelegate {
    
}

extension ProfileVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingItems.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.settingTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        
        cell.settingTitle.text = settingItems[indexPath.row]
//        cell.backgroundColor = UIColor.systemGreen
        cell.layer.cornerRadius = 15
        return cell
    }
    

    

    
    
}
