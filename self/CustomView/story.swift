//
//  Story.swift
//  self
//
//  Created by 原田摩利奈 on 2020/03/03.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//
import UIKit

class Story: UIView {
    @IBOutlet var itsuLabel: UILabel!
    @IBOutlet var dareLabel: UILabel!
    @IBOutlet var dokoLabel: UILabel!
    @IBOutlet var nanishitaTextView: UITextView!
    
//    override init(frame: CGRect) {
//        super.init()
//    }
    
    func set(character:Character) {
        itsuLabel.text = character.itsu
        dareLabel.text = character.dareto
        dokoLabel.text = character.dokode
        nanishitaTextView.text = character.nanishita
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
