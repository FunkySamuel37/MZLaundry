//
//  BannerView.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/9.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class BannerView: UIView {

  var backButton: UIButton = UIButton(frame: CGRectZero)
  var titelLabel: UILabel = UILabel(frame: CGRectZero)
  
  init(){
    super.init(frame: CGRectZero)
    
    backButton.setImage(UIImage(named: "3-1-1"), forState: UIControlState.Normal)
    
    self.addSubview(backButton)
    self.addSubview(titelLabel)
    self.backgroundColor = UIColor.whiteColor()
    addConstraintsWithSubviews()
  }
  
  convenience init(title: String){
    self.init()
    self.titelLabel.text = title
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  func addConstraintsWithSubviews(){
    self.snp_makeConstraints { (make) -> Void in
      make.leading.trailing.top.bottom.equalTo(self)
    }
    
    backButton.snp_makeConstraints { (make) -> Void in
      make.leading.equalTo(self).offset(13)
      make.bottom.equalTo(self).offset(-11)
      make.width.equalTo(11)
      make.height.equalTo(22)
    }
    
    titelLabel.snp_makeConstraints { (make) -> Void in
      make.centerX.equalTo(self)
      make.centerY.equalTo(backButton)
    }
  }

}
