//
//  extention.swift
//  self
//
//  Created by 原田摩利奈 on 2020/06/23.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    static func getRandomStringWithLength(length: Int) -> String {
        let letters : String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        for _ in 0 ..< length {
            let char = letters.randomElement()
            randomString.append(char!)
        }
        return randomString
    }
}

extension UIImageView{
    //画像を非同期で読み込む
    func loadImage(urlString: String){
        let CACHE_SEC : TimeInterval = 5 * 60; //5分キャッシュ
        let req = URLRequest(url: NSURL(string:urlString)! as URL,
                             cachePolicy: .returnCacheDataElseLoad,
                             timeoutInterval: CACHE_SEC);
        let conf =  URLSessionConfiguration.default;
        let session = URLSession(configuration: conf, delegate: nil, delegateQueue: OperationQueue.main);
        session.dataTask(with: req, completionHandler:
            { (data, resp, err) in
                if((err) == nil){ //Success
                    let image = UIImage(data:data!)
                    self.image = image;
                    
                }else{ //Error
                    print("SimpleAsyncImageView:Error \(err?.localizedDescription)");
                }
        }).resume();
    }
    //画像を非同期で読み込む
    func loadImageCircle(urlString: String){
        let CACHE_SEC : TimeInterval = 5 * 60; //5分キャッシュ
        let req = URLRequest(url: NSURL(string:urlString)! as URL,
                             cachePolicy: .returnCacheDataElseLoad,
                             timeoutInterval: CACHE_SEC);
        let conf =  URLSessionConfiguration.default;
        let session = URLSession(configuration: conf, delegate: nil, delegateQueue: OperationQueue.main);
        session.dataTask(with: req, completionHandler:
            { (data, resp, err) in
                if((err) == nil){ //Success
                    let image = UIImage(data:data!)
                    
                    self.image = image?.maskCorner(radius: (image?.size.width)! / 2)
                    
                    
                }else{ //Error
                    print("SimpleAsyncImageView:Error \(err?.localizedDescription)");
                }
        }).resume();
    }
}

extension UIImage {
    
    func maskCorner(radius r: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        
        let rect = CGRect(origin:  CGPoint.zero, size: self.size)
        UIBezierPath(roundedRect: rect, cornerRadius: r).addClip()
        draw(in: rect)
        let clippedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return clippedImage
    }
}

