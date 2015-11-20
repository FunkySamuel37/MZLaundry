//
//  PresentingAnimator.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/16.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit
import pop

class PresentingAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  
  let screenSize = UIScreen.mainScreen().bounds
  
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 0.3
  }
  
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
    fromView.userInteractionEnabled = false
    
    let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!.view
    toView.frame               = CGRect(x: screenSize.width, y: 0, width: screenSize.width, height: screenSize.height)
    toView.layer.shadowRadius  = 5.0
    toView.layer.shadowColor   = UIColor.blackColor().CGColor
    toView.layer.shadowOffset  = CGSizeMake(-5.0, 0.0)
    toView.layer.shadowOpacity = 0.5
    

    let containerView = transitionContext.containerView()
    containerView?.addSubview(toView)

//    let panGesture = UIPanGestureRecognizer(target: <#T##AnyObject?#>, action: <#T##Selector#>)
    
    let toViewPositionAnimate = UtilityAnimator.basicPositionXAnimate(view: toView,
                                                              transX: screenSize.width / 2.0,
                                                            duration: self.transitionDuration(transitionContext))
    toViewPositionAnimate.completionBlock = {(toViewPositionAnimate,finish) in
      toView.userInteractionEnabled = true
      transitionContext.completeTransition(true)
      print("animationComplete")
    }
    
    toView.pop_addAnimation(toViewPositionAnimate, forKey: "toViewPositionAnimate")
    
    let fromViewPositionAnimate = UtilityAnimator.basicPositionXAnimate(view: fromView, transX: 0.0, duration: self.transitionDuration(transitionContext))
    fromView.pop_addAnimation(fromViewPositionAnimate, forKey: "fromViewPositionAnimate")
    
  }
}
