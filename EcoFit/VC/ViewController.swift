//
//  ViewController.swift
//  EcoFit
//
//  Created by 겸 on 2022/09/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var adressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
            

    }
    
    func setUI(){
        configureAdressLabel()
    }
    
    func configureAdressLabel(){
        adressLabel.layer.cornerRadius = 20
        adressLabel.backgroundColor = UIColor(red: 0.498, green: 0.718, blue: 0.494, alpha: 0.5)

        
        
    
    }


}

