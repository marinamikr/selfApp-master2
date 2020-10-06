//
//  CustomTableViewCell.swift
//  self
//
//  Created by 原田摩利奈 on 2020/08/30.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func setText(text: String) {
        settingLabel.text = text
        
    }
}
