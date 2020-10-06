//
//  TreeView.swift
//  self
//
//  Created by 原田摩利奈 on 2020/02/11.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit
import Firebase

class TreeView: UIView {
    
    @IBOutlet var itsuLabel: UILabel!
    @IBOutlet var dareLabel: UILabel!
    @IBOutlet var dokoLabel: UILabel!
    @IBOutlet var nanishitaTextView: UITextView!
    
    private var labelArray: [UILabel]
    
    override init(frame: CGRect) {
        labelArray = []
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        labelArray = []
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            
            view.frame = self.bounds
            view.frame = CGRect(origin: self.frame.origin, size: CGSize(width: UIScreen.main.bounds.size.width, height: self.frame.size.height))
            print("TreeView")
            print(UIScreen.main.bounds.size)
            print(self.bounds)
            view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.addSubview(view)
            makeContents(view: view, makeContents: 6)
        }
    }
    
    
    
    //
    //    func loadNib() {
    //
    //        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
    //                  view.frame = self.bounds
    //                  self.addSubview(view)
    //}
    //        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
    //            view.frame = self.bounds
    //            view.frame = self.bounds
    //            print("TreeView")
    //            print(self.bounds)
    //            view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    //            view.backgroundColor = UIColor.blue
    //            self.addSubview(view)
    //            makeContents(view: view, makeContents: 6)
    //        }
    
    //
    //        label.frame = CGRect(x: viewWidth / 4, y: viewHeight / 2, width: viewWidth / 2, height: 40)
    //        label.text = "Hello World"
    //        view.addSubview(label)
    
    
    
    
    //    }
    var postArray: [CharacterSet] = Array()
    
    
    var DBRef:DatabaseReference!
    
    
    func makeContents(view:UIView,makeContents: Int) {
        
        print(view.bounds)
        let viewWidth = view.bounds.width
        let viewHeight = view.bounds.height
        let centerX = Double(viewWidth / 2) + Double(view.frame.origin.x)
        let centerY = Double(viewHeight / 2) + Double(view.frame.origin.y)
        let radius = 50
        let labelWidth = 80.0
        let labelHeight = 80.0
        //angle　何度ずつずらすか
        //radius 半径
        //        print(String(centerX) + "," + String(centerY))
        
        for i in 0 ..< makeContents {
            let angle: Double = 360.0 / Double(makeContents)
            let x: Double = angle / 2 + angle * Double(i)
            //            print(x)
            let posX = Double(radius) * sin(x * (Double.pi / 180)) + centerX
            let posY = 50 - Double(radius) * cos(x * (Double.pi / 180))
            //            print(String(posX) + "," + String(posY))
            let label = UILabel()
            label.font = UIFont(name: "HiraMaruProN-W4", size: 15)
            label.frame = CGRect(x: posX - labelWidth / 2, y: posY - labelHeight / 2, width: labelWidth, height: labelHeight)
            //            label.backgroundColor = UIColor.red
            //            label.text = "data"
            labelArray.append(label)
            view.addSubview(label)
        }
        
        
        DBRef = Database.database().reference()
        
        //        DBRef.child("userData").child("8550A0A3-385E-4989-8C41-07F631C696BA").child("character").child("-M7gW4bDdq5UR7Fd2uth").child("key").observe(.value, with: { (snapshot) in
        //            print("##",snapshot.value)
        //            for itemSnapShot in snapshot.children  {
        //                let snap = itemSnapShot as! DataSnapshot
        //                let data = snap.value as! [String : AnyObject]
        //                print("####",data["key"])
        //                var post: CharacterSet = CharacterSet(charactersIn: data["key"] as! String)
        //                self.postArray.append(post)
        //
        //            }
        //            for label in self.labelArray {
        //                label.text = postArray[0]
        //            }
        //        })
        var array = [String]()
        var characters = [Character]()
        DBRef.child("userData").child(Util.getUUID()).child("character").observe(.value, with: { (snapshot) in
            print("##", snapshot.value)
            for itemSnapShot in snapshot.children  {
                let snap = itemSnapShot as! DataSnapshot
                let data = snap.value as! [String : AnyObject]
                
                let key = data["key"] as! String
                let itsu = data["itsu"] as! String
                let dokode = data["dokode"] as! String
                let dareto = data["dareto"] as! String
                let nanishita = data["nanishita"] as! String
                let sonota = data["sonota"] as! String
                let character = Character(key: key,
                                          itsu: itsu,
                                          dokode: dokode,
                                          dareto: dareto,
                                          nanishita: nanishita,
                                          sonota: sonota)
                characters.append(character)
                array.append(key)
                //                var post: CharacterSet = CharacterSet(charactersIn: data["key"] as! String)
                //                self.postArray.append(post)
                
            }
            
            for i in 0 ..< self.labelArray.count {
                let label = self.labelArray[i]
                if array.count > i {
                    label.text = array[i]
                }
                
            }
            
            if let story = characters.randomElement() {
                self.itsuLabel.text = story.itsu
                self.dareLabel.text = story.dareto
                self.dokoLabel.text = story.dokode
                self.nanishitaTextView.text = story.nanishita
                print(self.itsuLabel)
            }
            
        })
        
        
    }
    
}
