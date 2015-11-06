//
//  LaundryCell.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/4.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class LaundryCell: UICollectionViewCell {
  
//  var laundryType:LauntryType?
  var imageView:UIImageView!
  var lineView:UIView!
  var typeLabel:UILabel!
  var priceLabel:UILabel!
  var typeInfo:PopViewType?
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  func setupView(){
    imageView = UIImageView(frame: CGRect(x: (self.frame.width - 63) / 2, y: 20, width: 63, height: 70))
    self.contentView.addSubview(imageView)
    
    lineView = UIView(frame: CGRect(x: 20, y: 100, width: self.frame.width - 40, height: 1))
    lineView.backgroundColor = UIColor.getLightGrayBorderColor()
    self.contentView.addSubview(lineView)
    
    typeLabel = UILabel(frame: CGRect(x: (self.frame.width - 60 ) / 2, y: 113, width: 60, height: 14))
    typeLabel.font = UIFont(name: "STHeitiTC-Light", size: 14)
    typeLabel.textColor = UIColor.getDarkGrayFontColor()
    typeLabel.textAlignment = .Center
    self.contentView.addSubview(typeLabel)
    
    
    priceLabel = UILabel(frame: CGRect(x: (self.frame.width - 60 ) / 2, y: 132, width: 60, height: 19))
    priceLabel.font = UIFont(name: "MicrosoftYaHei", size: 19)
    priceLabel.textColor = UIColor.getCustOrangeColor()
    priceLabel.textAlignment = .Center
    self.contentView.addSubview(priceLabel)

  }
}
