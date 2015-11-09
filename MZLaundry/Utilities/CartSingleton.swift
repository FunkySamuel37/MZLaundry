//
//  CartSingleton.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/6.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class CartSingleton {
  
  class var sharedInstance: CartSingleton {
    
    struct Static {
      static var onceToken: dispatch_once_t = 0
      static var instance: CartSingleton? = nil
    }
    
    dispatch_once(&Static.onceToken){
      Static.instance = CartSingleton()
    }
    
    return Static.instance!
  }
  
  var cartItemArray:[ItemInCart] = []
  
  func storeCartInfo(item:PopViewType,count:Int){
    
    var addSuccess = false
    for storedItem in cartItemArray{
      if storedItem.type.name == item.name{
        storedItem.count += count
        addSuccess = true
        break
      }
    }
    if !addSuccess {
      let newStoredItem = ItemInCart(type: item)
      newStoredItem.count = count
      self.cartItemArray.append(newStoredItem)
    }
  }
}
