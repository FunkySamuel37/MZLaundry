//
//  ImageResize.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/6.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

extension UIImage {
  func resizeImageWith(scaleToSize:CGSize)->UIImage!{
    UIGraphicsBeginImageContextWithOptions(scaleToSize, false, 0.0)
    self.drawInRect(CGRect(x: 0, y: 0, width: scaleToSize.width, height: scaleToSize.height))
    let newimage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newimage
  }
}
