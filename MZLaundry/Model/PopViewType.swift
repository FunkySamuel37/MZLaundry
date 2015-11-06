//
//  PopViewType.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/2.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit


class PopViewType: NSObject {
  
  var name:String   = ""
  var image:String  = ""
  var price:String  = ""
  var desc:String   = ""
  var backGroundImage:String {
    
    return (self.name == "袋洗") ? "3-1-0":"normal-clothes-border"
  }
  var module:String {
    return (self.name == "袋洗") ? "/袋":"/件"
  }
  
  init(name:String,price:String,desc:String){
    self.name = name
    self.price = price
    self.desc = desc
    
  }
  
  init(name:String, price:String, desc:String, image:String){
    self.name = name
    self.price = price
    self.desc = desc
    self.image = image
  }
  
  
}

