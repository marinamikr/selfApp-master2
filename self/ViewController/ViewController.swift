//
//  ViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2019/12/17.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase

class ViewController: UIViewController {
    
    var isFirst: Bool = false
    let userDefaults = UserDefaults.standard
    
    var characterArray: [Character] = Array()
    var DBRef:DatabaseReference!
    var realm :Realm!
    var realmModelArray:Results<RealmModel>!
    var name: String!
    static var isTutorial = false

    @IBOutlet var businessCard: BusinessCard!
    @IBOutlet var treeCard: TreeView!
    @IBOutlet var story: Story!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var textField: UITextField!
    //    @IBOutlet var label1:UILabel!
    //    @IBOutlet var label2:UILabel!
    //    @IBOutlet var label3:UILabel!
    //    @IBOutlet var label4:UILabel!
    //    @IBOutlet var label5:UILabel!
    //    @IBOutlet var label6:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.bounds.width)
        DBRef = Database.database().reference()
        var isFirst: Bool = false

        
        // Do any additional setup after loading the view.
        realm = try! Realm()
        realmModelArray = realm.objects(RealmModel.self)
        
        //        for i in 0..<realmModelArray.count {
        //            switch i {
        //            case 0:
        //                label1.text = realmModelArray[i].text
        //                break
        //            case 1:
        //                label2.text = realmModelArray[i].text
        //                break
        //            case 2:
        //                label3.text = realmModelArray[i].text
        //                break
        //            case 3:
        //                label4.text = realmModelArray[i].text
        //                break
        //            case 4:
        //                label5.text = realmModelArray[i].text
        //                break
        //            case 5:
        //                label6.text = realmModelArray[i].text
        //                break
        //            default: break
        //
        //            }
        //        }
        businessCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.transition(_ :))))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userDefaults.register(defaults: ["isFirst":false])
        
        isFirst = userDefaults.bool(forKey: "isFirst")
        if !isFirst {
            performSegue(withIdentifier: "toTopViewController",sender: nil)
        }else{
            getData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
//           let elDrawer = self.navigationController?.parent?.parent as! KYDrawerController
//           (elDrawer.drawerViewController as! MenuItemViewController).dalegate = self
           isFirst = userDefaults.bool(forKey: "isFirst")
           if !isFirst {
               performSegue(withIdentifier: "toTopViewController",sender: nil)
           }else{
               getData()
        }
       }
    func getData()  {
           DBRef.child("userData").child(Util.getUUID()).child("selfCharacter").observe(.value, with: { (snapshot) in
               self.characterArray = []
               for itemSnapShot in snapshot.children  {
                   let snap = itemSnapShot as! DataSnapshot
                   let data = snap.value as! [String : AnyObject]
                   var character: Character = Character(key: data["key"] as! String, itsu: data["itsu"] as! String, dokode: data["dokode"] as! String, dareto: data["dareto"] as! String, nanishita: data["nanishita"] as! String, sonota: data["sonota"] as! String)
                   self.characterArray.append(character)
               }
            self.businessCard.setCharacter(characterArray: self.characterArray)
           })
        DBRef.child("userData").child(Util.getUUID()).observe(.value, with: { (snapshot) in
                let snap = snapshot as! DataSnapshot
                let data = snap.value as! [String : AnyObject]
//            self.nameLabel.text = data["name"] as! String
            self.businessCard.nameLabel.text = data["name"] as! String
        })
        
    }
//
//    func getStory() {
//        DBRef.child("userData").child(Util.getUUID()).child("character").observe(.value, with: { (snapshot) in
//
//
//    }
    @objc func transition(_ sender: UITapGestureRecognizer) {
        UIView.transition(with: self.businessCard, duration: 1.0, options: [.transitionFlipFromLeft], animations: nil, completion:{
            bool in
            if self.businessCard.treeView.alpha == 0 {
                self.businessCard.treeView.alpha = 1
            } else  {
                self.businessCard.treeView.alpha = 0
            }
            
//            self.story.isHidden = false
        })
        
    }
    
    //
    //    @objc func businessCardTapped(_ sender: UITapGestureRecognizer) {
    //        let anim = CABasicAnimation(keyPath: "transform.rotation.y")
    //        anim.fromValue = 0
    //        anim.toValue = 1 * M_PI
    //        anim.duration = 1.0
    //        anim.repeatCount = 1
    //        businessCard.layer.add(anim, forKey: "key")
    //
    //    }
    //
    @IBAction func addButton() {
        
        //        let saveData = RealmModel()
        //        saveData.text = textField.text
        //        try! realm.write() {
        //            realm.add(saveData)
        //        }
        //        print(saveData.text)
        
        let data = ["key": textField.text,"itsu": "","dokode": "","dareto": "","nanishita": "","sonota": ""] as [String : Any]
        
        DBRef.child("userData").child(Util.getUUID()).child("selfCharacter").childByAutoId().setValue(data)
        
    }
    
    
    //    @IBAction func rotationButton(){
    //               let storyboard: UIStoryboard = self.storyboard!
    //               let nextView = storyboard.instantiateViewController(withIdentifier: "toIntroductionViewController") as! IntroductionViewController
    //
    //               nextView.modalTransitionStyle = .flipHorizontal
    //
    //               self.present(nextView, animated: true, completion: nil)
    //    }
    
}
