//
//  LauntryType.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/4.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class LaundryType: NSObject {

  var typeName:String
  var typeImage:String
  var typePrice:String?
  

  
  init(typeName:String, typeImage:String, typePrice:String?){
    self.typeName = typeName
    self.typeImage = typeImage
    self.typePrice = typePrice
  }
}
