//
//  DetailVC.swift
//  EcoFit
//
//  Created by 겸 on 2022/09/17.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var semiTitleLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    var condition = ["분리수거 용기 청소하고 인증하기!", "","","",""]

    
    //    override func loadView() {
//        super.loadView()
//        updateUI()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    var maintitle : String?
    var semiTitle : String?
    var i = 0
//    var condition : String?
    
    
    func updateUI() {
//        if let semiTitle = self.semiTitle {
            
            mainTitleLabel.text = maintitle
            semiTitleLabel.text = semiTitle
        if maintitle == "분리수거 하기"{
            conditionLabel.text = "분리수거 용기 청소하고 인증하기!"
        }
        
        
        
//        }
    }
    
    
}
