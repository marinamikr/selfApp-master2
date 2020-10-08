//
//  PageViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2020/10/09.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
        self.navigationItem.title = "使い方"
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Mamelon", size: 20)]
    }
}

extension PageViewController : UIPageViewControllerDataSource {
    
    //ここに画面の数だけViewControllerを取得するメソッドを用意する
    func getFirst() -> FirstViewController {
        return storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
    }
    
    func getSecond() -> SecondViewController {
        return storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }
    
    func getThird() -> ThirdViewController {
        return storyboard!.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
    }
    
    func getForth() -> ForthViewController {
        return storyboard!.instantiateViewController(withIdentifier: "ForthViewController") as! ForthViewController
    }
    func getFifth() -> FifthViewController {
        return storyboard!.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
    }
    func getSixth() -> SixthViewController {
        return storyboard!.instantiateViewController(withIdentifier: "SixthViewController") as! SixthViewController
    }
    
    func getSeventh() -> SeventhViewController {
        return storyboard!.instantiateViewController(withIdentifier: "SeventhViewController") as! SeventhViewController
    }
    
    //戻る方向にスワイプされた場合の条件わけ
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //3番目の場合は2番目を表示。以下同様
        if viewController.isKind(of:ThirdViewController.self){
            return getSecond()
        }else if viewController.isKind(of:SecondViewController.self){
            return getFirst()
        }else if viewController.isKind(of:ForthViewController.self){
            return getThird()
        }else if viewController.isKind(of:FifthViewController.self){
            return getForth()
        }else if viewController.isKind(of:SixthViewController.self){
            return getFifth()
        }else if viewController.isKind(of:SeventhViewController.self){
            return getSixth()
//        }else if viewController.isKind(of:EighthViewController.self){
//            return getSeventh()
        }else{
            return nil
        }
    }
    
    //進む方向にスワイプされた場合の条件わけ
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //1番目の場合は2番目を表示。以下同様
        if viewController.isKind(of: FirstViewController.self){
            return getSecond()
        }else if viewController.isKind(of: SecondViewController.self){
            return getThird()
        }else if viewController.isKind(of: ThirdViewController.self){
            return getForth()
        }else if viewController.isKind(of: ForthViewController.self){
            return getFifth()
        }else if viewController.isKind(of: FifthViewController.self){
            return getSixth()
        }else if viewController.isKind(of: SixthViewController.self){
            return getSeventh()
//        }else if viewController.isKind(of: SeventhViewController.self){
//            return getEighth()
        }else{
            return nil
        }
    }
}

