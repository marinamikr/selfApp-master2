//
//  RealmModel.swift
//  self
//
//  Created by 原田摩利奈 on 2019/12/17.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import Foundation
import RealmSwift

class RealmModel: Object {
    @objc dynamic var date: String!
    @objc dynamic var text: String!
    @objc dynamic var image: NSData!
    @objc dynamic var itsu: String = ""
    @objc dynamic var dokode: String = ""
    @objc dynamic var dareto: String = ""
    @objc dynamic var nanishita: String = ""
    @objc dynamic var sonota: String = ""
}
