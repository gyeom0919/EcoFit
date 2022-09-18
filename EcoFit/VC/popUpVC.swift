//
//  PopUpViewController.swift
//  EventPopupView
//
//  Created by 겸 on 2022/09/16.
//

import UIKit

class popUpVC: UIViewController {
    
    private let popUpView = UIView()
    private let dismissLButton = UIButton()
    private let titleLabel = UILabel()
    private let dismissRbutton = UIButton()
    private let benefitLabel = UILabel()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         configurationView()
         configurationLeftButton()
         configurationBenefits()
         configurationTitle()
         configurationImage()
         // SetUp View
         view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
         
     }
     
     @objc func didTapDismissButton(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
     }
 }

extension popUpVC {
    
    func configurationView() {
        popUpView.backgroundColor = UIColor.white
        view.addSubview(popUpView)
        
        popUpView.layer.cornerRadius = 10
        
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: 434).isActive = true
    }
    
    func configurationTitle() {
        let titleLabel : UILabel = {
            let label = UILabel()
            label.text = "스타벅스 환경혜택"
            label.textColor = .black
//            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.font = UIFont(name: "NanumGothicBold", size: 20)
            label.backgroundColor = UIColor.systemGreen
            
            return label
        }()
        
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 29),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    func configurationBenefits() {
        let titleLabel : UILabel = {
            let label = UILabel()
            label.text = "개인컵 이용시 400원 할인"
            label.textColor = .black
//            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.font = UIFont(name: "NanumGothicBold", size: 16)
            label.numberOfLines = 0
            
            return label
        }()
        
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    func configurationImage() {
        var imageView : UIImageView
        imageView = UIImageView(frame: CGRectMake(0, 0, 200, 100))
        
        imageView.image = UIImage(named: "image 54")

        view.addSubview(imageView)
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 80),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -3),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        
    }
  
    
    // LEFT BUTTON
    func configurationLeftButton(){
        dismissLButton.setTitleColor(UIColor.blue, for: .normal)
        dismissLButton.setTitle("닫기", for: .normal)
        dismissLButton.addTarget(self, action: #selector(didTapDismissButton(_:)), for: .touchUpInside)
        dismissLButton.titleLabel?.font = UIFont(name: "NanumGothicExtraBold", size: 15)
        dismissLButton.layer.borderWidth = 1
        dismissLButton.layer.borderColor = UIColor.lightGray.cgColor
        dismissLButton.layer.cornerRadius = 6
        dismissLButton.setTitleColor(UIColor.black, for: .normal)
        
    
        popUpView.addSubview(dismissLButton)
        
        dismissLButton.translatesAutoresizingMaskIntoConstraints = false
        
        dismissLButton.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor,  constant: -47).isActive = true
        dismissLButton.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 16).isActive = true
        dismissLButton.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -16).isActive = true
        dismissLButton.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 339).isActive = true
//        dismissLButton.widthAnchor.constraint(equalToConstant: 167).isActive = true
//        dismissLButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    

}
