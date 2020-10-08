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
        self.setViewControllers([getFirst()], direction: .Forward, animated: true, completion: nil)
        self.dataSource = self
        
    }
    
    func getFirst() -> FirstViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
    }
   
    
    func getSecond() -> SecondViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
    }
    
    func getThird() -> ThirdViewController {
        return storyboard!.instantiateViewControllerWithIdentifier("ThirdViewController") as! ThirdViewController
    }
    
    
    
}

extension PageViewController : UIPageViewControllerDataSource {

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(ThirdViewController) {
            // 3 -> 2
            return getSecond()
        } else if viewController.isKindOfClass(SecondViewController) {
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return nil
        }
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(FirstViewController) {
            // 1 -> 2
            return getSecond()
        } else if viewController.isKindOfClass(SecondViewController) {
            // 2 -> 3
            return getThird()
        } else {
            // 3 -> end of the road
            return nil
        }
    }
}
