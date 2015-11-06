//
//  MyStepper.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/3.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class MyStepper: UIView {
  
  /*
  // Only override drawRect: if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  override func drawRect(rect: CGRect) {
  // Drawing code
  }
  */
  var countLabel: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView(){
    let backImage = UIImageView(frame: self.bounds)
    backImage.image = UIImage(named: "stepper_back")
    self.addSubview(backImage)
    
    let minusBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 52, height: self.frame.height))
    minusBtn.setImage(UIImage(named: "minusBtn_nor"), forState: UIControlState.Normal)
    minusBtn.setImage(UIImage(named: "minusBtn_prs"), forState: UIControlState.Highlighted)
    self.addSubview(minusBtn)
    
    let plusBtn = UIButton(frame: CGRect(x: self.frame.width - 52, y: 0, width: 52, height: self.frame.height))
    plusBtn.setImage(UIImage(named: "plusBtn_nor"), forState: UIControlState.Normal)
    plusBtn.setImage(UIImage(named: "plusBtn_prs"), forState: UIControlState.Highlighted)
    self.addSubview(plusBtn)
    
    countLabel = UILabel(frame: CGRect(x: 52, y: 0, width: self.frame.width - 104, height: self.frame.height))
    countLabel.text = "1"
    countLabel.textAlignment = NSTextAlignment.Center
    countLabel.font = UIFont(name: "MicrosoftYaHei", size: 22)
    countLabel.textColor = UIColor.getCustOrangeColor()
    self.addSubview(countLabel)
    
  }
}
