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
    toView?.userInteractionEnabled = true
    
    transitionContext.completeTransition(true)
    fromView?.removeFromSuperview()
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
//    shadowView.addSubview(fromController.view)
//    contantView.addSubview(toController.view)
//    contantView.addSubview(shadowView)
//    
//    toController.view.transform = CGAffineTransformMakeTranslation(-screenSize.width/2, 0)
//    shadowView.layer.shadowOffset = CGSizeZero
//    shadowView.layer.shadowRadius = 5.0
//    shadowView.layer.shadowColor = UIColor.blackColor().CGColor
//    
//    let animation = CABasicAnimation(keyPath: "shadowOpacity")
//    
//    animation.fromValue = 0.7
//    animation.toValue = 0.1
//    animation.duration = transitionDuration(transitionContext)
//    animation.repeatCount = 1.0
//    
//    shadowView.layer.addAnimation(animation, forKey: nil)
//    
//    UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
//      toController.view.transform = CGAffineTransformMakeTranslation(0, 0)
//      shadowView.transform = CGAffineTransformMakeTranslation(self.screenSize.width, 0)
//      }) { (_) -> Void in
//        transitionContext.completeTransition(true)
//        fromController.view.removeFromSuperview()
//
//    }
//  
//  }
}
