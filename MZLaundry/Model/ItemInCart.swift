//
//  ItemInCart.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/6.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class ItemInCart: NSObject {
  var type:PopViewType
  var count:Int = 1
  
  init(type:PopViewType){
    self.type = type
    
  }
  
}
