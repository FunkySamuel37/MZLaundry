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
  
//  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
//    let fromController =
//    transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
//    let toController =
//    transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
//    let contantView =
//    transitionContext.containerView()!
//    let shadowView = UIView(frame: UIScreen.mainScreen().bounds)
//    
//    shadowView.addSubview(toController.view)
//    contantView.addSubview(fromController.view)
//    contantView.addSubview(shadowView)
//    
//    shadowView.transform = CGAffineTransformMakeTranslation(screenSize.width, 0)
//    shadowView.layer.shadowOffset = CGSizeZero
//    shadowView.layer.shadowRadius = 5.0
//    shadowView.layer.shadowColor = UIColor.blackColor().CGColor
//    
//    let animation = CABasicAnimation(keyPath: "shadowOpacity")
//    
//    animation.fromValue = 0.1
//    animation.toValue = 0.7
//    animation.duration = transitionDuration(transitionContext)
//    animation.repeatCount = 1.0
//    
//    shadowView.layer.addAnimation(animation, forKey: nil)
//    
//    UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
//      fromController.view.transform = CGAffineTransformMakeTranslation(-self.screenSize.width/2, 0)
//      shadowView.transform = CGAffineTransformMakeTranslation(0, 0)
//      }) { (_) -> Void in
//        fromController.view.removeFromSuperview()
//        transitionContext.completeTransition(true)
//    }
//  }
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
    fromView.userInteractionEnabled = false
    
    let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!.view
    toView.frame = CGRect(x: screenSize.width, y: 0, width: screenSize.width, height: screenSize.height)
    
    let containerView = transitionContext.containerView()
    
    containerView?.addSubview(toView)
    
    let positionAnimate = POPBasicAnimation(propertyNamed: kPOPViewFrame)
    positionAnimate.toValue = NSValue(CGRect: screenSize)
    positionAnimate.duration = 0.3
    positionAnimate.completionBlock = {(positionAnimate,finish) in
      toView.userInteractionEnabled = true
      transitionContext.completeTransition(true)
      print("animationComplete")
    }
    
    toView.pop_addAnimation(positionAnimate, forKey: "positionAnimate")
    
  }
}
