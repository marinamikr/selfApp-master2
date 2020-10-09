//
//  BusinessCard.swift
//  self
//
//  Created by 原田摩利奈 on 2020/02/04.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift
import FirebaseDatabase


class BusinessCard: UIView {
    
    @IBOutlet var label1:UILabel!
    @IBOutlet var label2:UILabel!
    @IBOutlet var label3:UILabel!
    @IBOutlet var label4:UILabel!
    @IBOutlet var label5:UILabel!
    @IBOutlet var label6:UILabel!
    @IBOutlet var treeView: TreeView!
    @IBOutlet var nameLabel: UILabel!
    var DBRef:DatabaseReference!
    
    @IBOutlet var textField:UITextField!
    
    
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        loadNib()
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)!
    //        loadNib()
    //    }
    //
    //    func loadNib() {
    //        guard let view = UINib(nibName: "BusinessCard", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
    //            return
    //        }
    //
    //    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        DBRef = Database.database().reference()
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            print("BusinessCard")
            print(self.bounds)
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.addSubview(view)
        }
    }
    
    func setCharacter(characterArray:[Character]) {
        for i in 0 ..< characterArray.count {
            switch i {
            case 0:
                label1.text = characterArray[i].key
                break
            case 1:
                label2.text = characterArray[i].key
                break
            case 2:
                label3.text = characterArray[i].key
                break
            case 3:
                label4.text = characterArray[i].key
                break
            case 4:
                label5.text = characterArray[i].key
                break
            case 5:
                label6.text = characterArray[i].key
                break
            default: break
                
            }
        }
    }
    
    @IBAction func addButton() {
        textField.endEditing(true)
        
        let data = ["key": textField.text,"itsu": "","dokode": "","dareto": "","nanishita": "","sonota": ""] as [String : Any]
        
        DBRef.child("userData").child(Util.getUUID()).child("selfCharacter").childByAutoId().setValue(data)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // キーボードを閉じる
//        UITextField.resignFirstResponder
//        return true
//    }
}

extension BusinessCard :UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.endEditing(true)
    }
}
