//
//  SelectCharacterViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2020/01/07.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit
import RealmSwift

class SelectCharacterViewController: UIViewController {
    
    var realm :Realm!
    
    var id = ""
    var name = ""
    
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(name)
        print(id)
        nameLabel.text = name
    }
    
    @IBAction func saveButton() {
        let saveData1 = RealmModel()
        saveData1.text = textField1.text
        try! realm.write() {
            realm.add(saveData1)
        }
        
        let saveData2 = RealmModel()
        saveData2.text = textField2.text
        try! realm.write() {
            realm.add(saveData2)
        }
        let saveData3 = RealmModel()
        saveData3.text = textField3.text
        try! realm.write() {
            realm.add(saveData3)
        }
        let saveData4 = RealmModel()
        saveData4.text = textField4.text
        try! realm.write() {
            realm.add(saveData4)
        }
        
        
        self.performSegue(withIdentifier: "toRoulettoView", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toRoulettoView" {
            
            let nextView = segue.destination as! RouletteViewController
            
            nextView.text1 = textField1.text!
            nextView.text2 = textField2.text!
            nextView.text3 = textField3.text!
            nextView.text4 = textField4.text!
            nextView.id = id
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        textField3.resignFirstResponder()
        textField4.resignFirstResponder()
        return true
    }
}

extension SelectCharacterViewController :UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
