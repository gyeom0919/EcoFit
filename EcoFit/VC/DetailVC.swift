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
    var condition : String?
    
    
    func updateUI() {
//        if let semiTitle = self.semiTitle {
            
        mainTitleLabel.text = maintitle
        semiTitleLabel.text = semiTitle
        conditionLabel.text = condition

        }
        
        
        
//        }
    }
    
    

