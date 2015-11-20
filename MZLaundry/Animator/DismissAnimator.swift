//
//  DismissAnimator.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/17.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  let screenSize = UIScreen.mainScreen().bounds
  
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 0.3
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view
    let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)?.view
    
    let fromViewTransXA = UtilityAnimator.basicPositionXAnimate(view: fromView!, transX: screenSize.width * 1.5, duration: self.transitionDuration(transitionContext))
    fromViewTransXA.completionBlock = {(animation, finish) in
      if finish {
        toView?.userInteractionEnabled = true
        fromView?.removeFromSuperview()
        transitionContext.completeTransition(true)
      }
    }
    fromView?.pop_addAnimation(fromViewTransXA, forKey: "fromViewTransXA")
    
    let toViewTransXA = UtilityAnimator.basicPositionXAnimate(view: toView!, transX: screenSize.width / 2.0, duration: self.transitionDuration(transitionContext))
    toView?.pop_addAnimation(toViewTransXA, forKey: "toViewTransXA")
  }
  
}
