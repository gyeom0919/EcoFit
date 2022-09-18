//
//  ProfileTableViewCell.swift
//  EcoFit
//
//  Created by 겸 on 2022/09/18.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileBackView: UIView!
    @IBOutlet weak var settingTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileBackView.layer.cornerRadius = 8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
