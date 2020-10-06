//
//  Character.swift
//  self
//
//  Created by 原田摩利奈 on 2020/01/28.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import Foundation
class Character: CustomStringConvertible{
    @objc dynamic var key: String!
    @objc dynamic var itsu: String!
    @objc dynamic var dokode: String!
    @objc dynamic var dareto: String!
    @objc dynamic var nanishita: String!
    @objc dynamic var sonota: String!
    
    var description: String { return "key:" + key + "," + "itsu:" + itsu + "," + "dokode:" + dokode + "," + "dareto:" + dareto + "," + "nanishita:" + nanishita + "," + "sonota:" + sonota}
    
    init(key:String,itsu:String,dokode:String,dareto:String,nanishita:String,sonota:String) {
        self.key = key
        self.itsu = itsu
        self.dokode = dokode
        self.dareto = dareto
        self.nanishita = nanishita
        self.sonota = sonota
    }
}
