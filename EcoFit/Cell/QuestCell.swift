//
//  QuestCell.swift
//  EcoFit
//
//  Created by 겸 on 2022/09/17.
//

import UIKit

class QuestCell: UITableViewCell {
    
    
//    var imageList = ["dong_medal","dong_medal","dong_medal","dong_medal","eun_medal","eun_medal","eun_medal","eun_medal","geum_medal","geum_medal","geum_medal","geum_medal"]
    
    
    @IBOutlet weak var custom_Image: UIImageView!
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
//    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var fakeButton: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        custom_Image.image = UIImagxe(systemName: imageList[IndexPath.row])
    }

    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension QuestCell {
    
    
}
