//
//  QuestCell.swift
//  EcoFit
//
//  Created by 겸 on 2022/09/17.
//

import UIKit

class QuestCell: UITableViewCell {
    
    
    @IBOutlet weak var custom_Image: UIImageView!
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
//    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var fakeButton: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension QuestCell {
    
    
}
