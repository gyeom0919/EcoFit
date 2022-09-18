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
    
    var questList = ["분리수거 Bronze", "오늘도 EcoFit하게 Bronze", "웨폰마스터 Bronze", "아마추어 워커", "분리수거 Silver", "오늘도 EcoFit하게 Silver", "웨폰마스터 Sliver", "프로 워커", "분리수거 Gold", "오늘도 EcoFit하게 Gold", "웨폰마스터 Gold","마스터 워커"]
    
    var questTitle = ["분리수거 하기", "마일리지 적립하기", "무기 구입하기", "만보 걷기", "분리수거 하기", "마일리지 적립하기", "무기 구입하기", "만보 걷기", "분리수거 하기", "마일리지 적립하기", "무기 구입하기", "만보 걷기"]
    
    var condition = ["분리수거 1회 완료하기", "3일 연속 마일리지 적립하기", "무기 3회 구입하기", "만보 걷기 7일차", "분리수거 5회 완료하", "7일 연속 마일리지 적립하기", "무기 6회 구입하기", "만보 걷기 14일차", "분리수거 10회 완료하기", "10일 연속 마일리지 적립하기", "무기 9회 구입하기", "만보 걷기 21일차"]
    
    var imageList = ["dong_medal","dong_medal","dong_medal","dong_medal","eun_medal","eun_medal","eun_medal","eun_medal","gum_medal","gum_medal","gum_medal","gum_medal"]
    
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
        cell.mainTitleLabel.text = questTitle[indexPath.row]
//        cell.custom_Image.image = UIImage(named: " imageList[indexPath.row]")

//        cell.custom_Image.image = UIImage(named: questTitle[indexPath.row])
//
        
//        cell.moreButton.layer.backgroundColor = UIColor.gray.cgColor
//        cell.moreButton.layer.cornerRadius = 17
        
        cell.custom_Image.image = UIImage(named: imageList[indexPath.row])
        
        
        
        
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
                vc?.maintitle = questTitle[index]
                vc?.semiTitle = questList[index]
                vc?.condition = condition[index]
            
            }
        }
        
    }
}



