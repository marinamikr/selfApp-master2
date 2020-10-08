//
//  SettingViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2020/02/11.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var settingTableVIew: UITableView!
    var nameArray = ["プロフィール","チュートリアル","その他"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIImage(named: nameArray[0])
        settingTableVIew.dataSource = self
        settingTableVIew.delegate = self
        self.settingTableVIew.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
}
extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
           performSegue(withIdentifier: "toPlofileViewController", sender: nil)
        case 1:
            performSegue(withIdentifier: "toPageViewController", sender: nil)
        case 2:
            performSegue(withIdentifier: "toOtherViewController", sender: nil)
        default:
            return
        }
        return
    }
}
extension SettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTableVIew.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.setText(text: nameArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


