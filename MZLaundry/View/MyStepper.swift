//
//  MyStepper.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/3.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

protocol CountChangeDelegate{
  func countChange()
}

class MyStepper: UIView {
  
  /*
  // Only override drawRect: if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  override func drawRect(rect: CGRect) {
  // Drawing code
  }
  */
  var item: ItemInCart?
  var countChangeDelegate: CountChangeDelegate?
  var countLabel: UILabel!
  var count: Int = 1 {
    didSet {
      if count < 1{
        count = 1
      }
      
      self.countLabel.text = String(count)
    }
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
    
  }
  
  func setupView(){
    let btnWidth = self.frame.width / 180.0 * 52.0
    let fontSize = self.frame.width / 180.0 * 22.0
    let backImage = UIImageView(frame: self.bounds)
    backImage.image = UIImage(named: "stepper_back")
    self.addSubview(backImage)
    
    let minusBtn = UIButton(frame: CGRect(x: 0, y: 0, width: btnWidth, height: self.frame.height))
    minusBtn.setImage(UIImage(named: "minusBtn_nor"), forState: UIControlState.Normal)
    minusBtn.setImage(UIImage(named: "minusBtn_prs"), forState: UIControlState.Highlighted)
    minusBtn.addTarget(self, action: "minusOne", forControlEvents: UIControlEvents.TouchUpInside)
    self.addSubview(minusBtn)
    
    let plusBtn = UIButton(frame: CGRect(x: self.frame.width - btnWidth, y: 0, width: btnWidth, height: self.frame.height))
    plusBtn.setImage(UIImage(named: "plusBtn_nor"), forState: UIControlState.Normal)
    plusBtn.setImage(UIImage(named: "plusBtn_prs"), forState: UIControlState.Highlighted)
    plusBtn.addTarget(self, action: "plusOne", forControlEvents: UIControlEvents.TouchUpInside)
    self.addSubview(plusBtn)
    
    countLabel = UILabel(frame: CGRect(x: btnWidth, y: 0, width: self.frame.width - btnWidth * 2.0, height: self.frame.height))
    countLabel.text = "1"
    countLabel.textAlignment = NSTextAlignment.Center
    countLabel.font = UIFont(name: "MicrosoftYaHei", size: fontSize)
    countLabel.textColor = UIColor.getCustOrangeColor()
    self.addSubview(countLabel)
    
  }
  
  func minusOne(){
    self.count--
    self.item?.count = self.count
    self.countChangeDelegate?.countChange()
  }
  
  func plusOne(){
    self.count++
    self.item?.count = self.count
    self.countChangeDelegate?.countChange()
  }
}
