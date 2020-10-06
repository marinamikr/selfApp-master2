//
//  StoryViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2020/01/14.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase

class StoryViewController: UIViewController {
    
    var DBRef:DatabaseReference!
    var realm :Realm!
    var realmModelArray:Results<RealmModel>!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textView1: UITextView!
    @IBOutlet var textView2: UITextView!
    @IBOutlet var button: UIButton!
    
    var text1 = ""
    var text2 = ""
    var text3 = ""
    var text4 = ""
    var id = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 2.0
        
        label.text = text1
        
        // Do any additional setup after loading the view.
        realm = try! Realm()
        // Do any additional setup after loading the view.
        DBRef = Database.database().reference()
        
    }
    
    @IBAction func saveButton() {
        
        let saveData1 = RealmModel()
        saveData1.itsu = textField1.text!
        try! realm.write() {
            realm.add(saveData1)
        }
        let saveData2 = RealmModel()
        saveData2.dokode = textField2.text!
        try! realm.write() {
            realm.add(saveData2)
        }
        
        let saveData3 = RealmModel()
        saveData3.dareto = textField3.text!
        try! realm.write() {
            realm.add(saveData3)
        }
        let saveData4 = RealmModel()
        saveData4.nanishita = textView1.text!
        try! realm.write() {
            realm.add(saveData4)
        }
        let saveData5  = RealmModel()
        saveData5.sonota = textView2.text!
        try! realm.write() {
            realm.add(saveData5)
        }
        
        print(saveData1.itsu)
        print(saveData2.dokode)
        print(saveData3.dareto)
        print(saveData4.nanishita)
        print(saveData5.sonota)
        
        let data = ["key": label.text,"itsu": textField1.text,"dokode": textField2.text,"dareto": textField3.text,"nanishita": textView1.text,"sonota": textView2.text] as [String : Any]
//        let data2 = ["key": text2,"itsu": "","dokode": "","dareto": "","nanishita": "","sonota": ""] as [String : Any]
//        let data3 = ["key": text3,"itsu": "","dokode": "","dareto": "","nanishita": "","sonota": ""] as [String : Any]
//        let data4 = ["key": text4,"itsu": "","dokode": "","dareto": "","nanishita": "","sonota": ""] as [String : Any]
        DBRef.child("userData").child(id).child("character").childByAutoId().setValue(data)
//        DBRef.child("userData").child(id).child("character").childByAutoId().setValue(data2)
//        DBRef.child("userData").child(id).child("character").childByAutoId().setValue(data3)
//        DBRef.child("userData").child(id).child("character").childByAutoId().setValue(data4)
        
        //        self.dismiss(animated: true, completion: nil)
        //        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: {
        //            let tabVC = self.presentingViewController?.presentingViewController?.presentingViewController?.tabBarController
        //            tabVC?.selectedIndex = 0
        //        })
        
        let customUITabBarController = self.presentingViewController?.presentingViewController?.presentingViewController as! CustomUITabBarController
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: {
            customUITabBarController.selectedIndex = 0
        })
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
