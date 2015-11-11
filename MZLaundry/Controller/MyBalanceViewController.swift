//
//  MyBalanceViewController.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/9.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class MyBalanceViewController: UIViewController {
  
  var bannerView = BannerView(title: "我的洗衣币")
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.blackColor()
    self.view.addSubview(bannerView)
    
    addConstraintsWithSubviews()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func addConstraintsWithSubviews(){
    self.bannerView.snp_makeConstraints { (make) -> Void in
      make.leading.trailing.top.equalTo(self.view)
      make.height.equalTo(64)
    }
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
