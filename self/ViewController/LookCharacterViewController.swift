//
//  LookCharacterViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2020/06/09.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit
import Firebase

class LookCharacterViewController: UIViewController {
      
        @IBOutlet var itsu: UILabel!
        @IBOutlet var doko: UILabel!
        @IBOutlet var dare: UILabel!
        @IBOutlet var nanishita: UILabel!
        
        var characterArray: [Character] = Array()
        var DBRef:DatabaseReference!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            DBRef = Database.database().reference()
            
            // Do any additional setup after loading the view.
        }
        
        var array = [String]()

        func setCharacter() {
            DBRef.child("userData").child("8550A0A3-385E-4989-8C41-07F631C696BA").child("character").child("-M9Nr04iAQj1OjOn6trW").observe(.value, with: { (snapshot) in
                print("##",snapshot.value)
                for itemSnapShot in snapshot.children  {
                    let snap = itemSnapShot as! DataSnapshot
                    let data = snap.value as! [String : AnyObject]
                    print("doko",data["dokode"])
                    let post = data["dokode"] as! String
                    self.array.append(post)
                    self.doko.text = post
                    //                var post: CharacterSet = CharacterSet(charactersIn: data["key"] as! String)
                    //                self.postArray.append(post)
    
                }
    
    
                //            for文で取り出すarrayの中身を
                //            labelarrayの一個づつに入れてく
            })
    
    
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
