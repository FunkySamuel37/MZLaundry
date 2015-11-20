//
//  UtilityAnimator.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/18.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit
import pop

class UtilityAnimator: NSObject {
  class func basicPositionXAnimate(view view: UIView, transX:CGFloat, duration:Double?)-> POPBasicAnimation {
    let animation = POPBasicAnimation()
    animation.property = POPAnimatableProperty.propertyWithName(kPOPLayerPositionX) as! POPAnimatableProperty
    animation.toValue = transX
    if let time = duration {
      animation.duration = time
    } else {
      animation.duration = 0.3
    }
    
    return animation
  }
}
