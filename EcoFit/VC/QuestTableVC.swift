//
//  QuestTableVC.swift
//  EcoFit
//
//  Created by 겸 on 2022/09/17.
//

import UIKit

class QuestTableVC: UIViewController {

    @IBOutlet weak var questTable: UITableView!
    
    let questName : String = "questCell"
    
    
    var param : QuestData!
    
    var questList = ["분리수거하기", "현일이 한대치기", "카페가서 텀블러에 담기", "스테인레스 빨대 장만하기", "걸어다니기"]
    
//    @IBAction func moveView(_ sender: Any) {
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//            performSegue(withIdentifier: "showDetail", sender: indexPath.row)
//        }
//    }
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        questTable.dataSource = self
        questTable.delegate = self
        
        questTable.separatorStyle = .none
    }
    
//    @objc func buttonTapped(sender : UIButton) {
//        debugPrint("버튼 클릭됨")
        
//        // 버튼 색 바꾸기
//        sender.backgroundColor = sender.backgroundColor == UIColor(red: 0.082, green: 0.451, blue: 0.996, alpha: 1) ? UIColor.gray : UIColor(red: 0.082, green: 0.451, blue: 0.996, alpha: 1)
//
//        if sender.backgroundColor == UIColor.gray {
//            sender.backgroundColor = UIColor(red: 0.082, green: 0.451, blue: 0.996, alpha: 1)
//        }
        
//        popUpViewController.modalPresentationStyle = .overCurrentContext
//        present(popUpViewController, animated: true, completion: nil)
    }

//}

extension QuestTableVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)


//        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
}

extension QuestTableVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = questTable.dequeueReusableCell(withIdentifier: questName, for: indexPath) as! QuestCell
        
        cell.cellBackground.layer.cornerRadius = cell.cellBackground.frame.height / 2 - 30
        cell.subtitleLabel.text = questList[indexPath.row]
//        cell.textLabel?.text = questList[indexPath.row]
        
        cell.custom_Image.image = UIImage(named: questList[indexPath.row])
        
//        cell.moreButton.layer.backgroundColor = UIColor.gray.cgColor
//        cell.moreButton.layer.cornerRadius = 17
        
        cell.fakeButton.layer.backgroundColor = UIColor.gray.cgColor
        cell.fakeButton.layer.cornerRadius = 17
        
        return cell
    }

}

extension QuestTableVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailVC
            if let index = sender as? Int {
//                vc?.maintitle =
                vc?.semiTitle = questList[index]
            }
        }
        
    }
}



