//
//  MainTabController.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/10/17.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      let titles = ["首页","洗衣篮","我","更多"]
//        self.tabBarItem.
      for i in 0..<self.viewControllers!.count{
        let vc = viewControllers![i]
        let image = UIImage(named: "2-1-tb\(i+1)-1")
        let newSize = CGSize(width: 25, height: 25)
        let newimage = image?.resizeImageWith(newSize).imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let selectedImage = UIImage(named: "2-1-tb\(i+1)-2")
        let newselectedimage = selectedImage?.resizeImageWith(newSize).imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        vc.tabBarItem = UITabBarItem(title: titles[i], image: newimage, selectedImage: newselectedimage)
      }
      
      tabBar.tintColor = UIColor(red: 119/255, green: 202/255, blue: 249/255, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
