//
//  RouletteViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2020/01/07.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit

class RouletteViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    
    var text1 = ""
    var text2 = ""
    var text3 = ""
    var text4 = ""
    var id = ""
    
    var number: Int!
    var chooseLabel: String!
    var otherLabel1: String!
    var otherLabel2: String!
    var otherLabel3: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = text1
        label2.text = text2
        label3.text = text3
        label4.text = text4
        
    }
    
    @IBAction func againButton(){
        
        image1.image = nil
        image2.image = nil
        image3.image = nil
        image4.image = nil
        
        number = Int.random(in: 0...3)
        if number == 0 {
            image1.image = UIImage(named: "yazurushi.png")
        } else if number == 1 {
            image2.image = UIImage(named: "yazurushi.png")
        } else if number == 2 {
            image3.image = UIImage(named: "yazurushi.png")
        } else {
            image4.image = UIImage(named: "yazurushi.png")
        }
    }
    
    @IBAction func saveButton() {
        if image1.image != nil {
            chooseLabel = label1.text
            otherLabel1 = label2.text
            otherLabel2 = label3.text
            otherLabel3 = label4.text
        } else if image2.image != nil {
            chooseLabel = label2.text
            otherLabel1 = label1.text
            otherLabel2 = label3.text
            otherLabel3 = label4.text
        } else if image3.image !=  nil {
            chooseLabel = label3.text
            otherLabel1 = label1.text
            otherLabel2 = label2.text
            otherLabel3 = label4.text
        } else {
            chooseLabel = label4.text
            otherLabel1 = label1.text
            otherLabel2 = label2.text
            otherLabel3 = label3.text
        }
        
        self.performSegue(withIdentifier: "toStoryViewController", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toStoryViewController" {
            
            let nextView = segue.destination as! StoryViewController
            
            nextView.text1 = chooseLabel
            nextView.text2 = otherLabel1
            nextView.text3 = otherLabel2
            nextView.text4 = otherLabel3
            nextView.id = id
        }
    }
    @IBAction func startButton(){
        
        
        number = Int.random(in: 0...3)
        if number == 0 {
            image1.image = UIImage(named: "yazurushi.png")
            image2.image = nil
            image3.image = nil
            image4.image = nil
        } else if number == 1 {
            image2.image = UIImage(named: "yazurushi.png")
            image1.image = nil
            image3.image = nil
            image4.image = nil
        } else if number == 2 {
            image3.image = UIImage(named: "yazurushi.png")
            image1.image = nil
            image2.image = nil
            image4.image = nil
        } else {
            image4.image = UIImage(named: "yazurushi.png")
            image2.image = nil
            image3.image = nil
            image1.image = nil
        }
        
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
