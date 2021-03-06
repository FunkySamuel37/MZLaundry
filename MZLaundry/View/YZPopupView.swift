//
//  YZPopupView.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/2.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit
import pop

protocol AddToCartDelegate{
  func addToCart(item:PopViewType,count:Int)
}

class YZPopupView: UIView {
  
  /*
  // Only override drawRect: if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  override func drawRect(rect: CGRect) {
  // Drawing code
  }
  */
  
  let screenSize = UIScreen.mainScreen().bounds
  var type:PopViewType!
  
  private var barrierView: UIControl!
  private var contentView: UIView!
  
  
  private var clothImageView: UIImageView!
  private var nameLabel: UILabel!
  private var priceLabel: UILabel!
  private var moduleLabel: UILabel!
  private var descLabel: UILabel!
  private var clothBackImageView: UIImageView!
  private var addCartButton: UIButton!
  private var stepper: MyStepper!
  var delegate:AddToCartDelegate!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()

    
  }
  
  convenience init(frame: CGRect,clothesType: PopViewType){
    self.init(frame: frame)
    self.type = clothesType
    setupData()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews(){
    //barrierView
    barrierView                    = UIControl(frame: self.screenSize)
    barrierView.backgroundColor    = UIColor.blackColor()
    barrierView.addTarget(self, action: "dismiss", forControlEvents: UIControlEvents.TouchUpInside)
    barrierView.alpha              = 0.0
    self.addSubview(barrierView)
    
    //contentView
    contentView                    = UIView(frame: CGRect(x: (self.screenSize.width - 290) / 2,
      y: self.screenSize.height,
      width: 295,
      height: 290))
    contentView.backgroundColor    = UIColor.whiteColor()
    self.addSubview(contentView)
    
    //clothBackImageView
    clothBackImageView             = UIImageView(frame: CGRect(x: 15, y: 20, width: 110, height: 125))
    contentView.addSubview(clothBackImageView)
    
    //clothImageView
    let clothBackFrame             = clothBackImageView.bounds
    clothImageView                 = UIImageView(frame: CGRect(x: (clothBackFrame.width - 70) / 2, y: (clothBackFrame.height - 90) / 2, width: 70, height: 90))
    clothBackImageView.addSubview(clothImageView)
    
    //nameLabel
    nameLabel                      = UILabel(frame: CGRect(x: 125 + 10 , y: 20, width: 70, height: 25))
    nameLabel.textAlignment        = NSTextAlignment.Left
    nameLabel.font                 = UIFont(name: "STHeitiTC-Light", size: 20)
    contentView.addSubview(nameLabel)
    
    //priceLabel
    priceLabel                     = UILabel(frame: CGRect(x: 125 + 10 , y: 55, width: 50, height: 25))
    priceLabel.font                = UIFont(name: "MicrosoftYaHei", size: 22)
    priceLabel.textColor           = UIColor.getCustOrangeColor()
    contentView.addSubview(priceLabel)
    
    //moduleLabel
    moduleLabel                    = UILabel(frame: CGRect(x: 125 + 10 + priceLabel.frame.width, y: 64, width: 50, height: 25))
    moduleLabel.font               = UIFont(name: "STHeitiTC-Light", size: 15)
    moduleLabel.sizeToFit()
    contentView.addSubview(moduleLabel)
    
    //descLabel
    descLabel                      = UILabel(frame: CGRect(x: 125 + 10 , y: 98, width: contentView.frame.width - 135 - 25, height: 50))
    descLabel.numberOfLines        = 0
    descLabel.font                 = UIFont(name: "STHeitiTC-Light", size: 10)
    descLabel.textColor            = UIColor.getDarkGrayFontColor()
    contentView.addSubview(descLabel)
    
    //addCartButton
    addCartButton                  = UIButton(frame: CGRect(x: 4, y: contentView.frame.height - 45 - 4, width: contentView.frame.width - 8, height: 45))
    addCartButton.backgroundColor  = UIColor.getMainBlueColor()
    addCartButton.setTitle("加入购物车", forState: UIControlState.Normal)
    addCartButton.titleLabel?.font = UIFont(name: "STHeitiTC-Light", size: 15)
    addCartButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    addCartButton.addTarget(self, action: "AddCart", forControlEvents: UIControlEvents.TouchUpInside)
    contentView.addSubview(addCartButton)
    
    stepper = MyStepper(frame: CGRect(x: (contentView.frame.width - 180) / 2, y: contentView.frame.height - addCartButton.frame.height - 45 - 23, width: 180, height: 45))
    
    contentView.addSubview(stepper)
    
    
  }
  
  func setupData(){
    clothBackImageView.image       = UIImage(named: type.backGroundImage)
    clothImageView.image           = UIImage(named: type.image)
    nameLabel.text                 = type.name
    priceLabel.text                = "¥" + type.price
    priceLabel.sizeToFit()

    moduleLabel.text               = type.module
    descLabel.text                 = type.desc

  }
  
  func dismiss(){
    UIView.animateWithDuration(0.3, animations: { () -> Void in
      
      
      self.contentView.frame.origin.y += 310
      self.barrierView.alpha -= 0.5
      }) { (finished) -> Void in
        self.removeFromSuperview()
    }
//    let contentViewtranY = springTransYAnimationFor(contentView, transY: 310)
//    let alphaAnime       = basicAlphaAnimationFor(nil, alpha: 0)
//    alphaAnime.delegate = self
//    contentView.pop_addAnimation(contentViewtranY, forKey: "contentViewtranY")
//    barrierView.pop_addAnimation(alphaAnime, forKey: "alphaAnimaDissmiss")
    
  }
  
  func AddCart(){
    
    self.delegate.addToCart(self.type,count: self.stepper.count)
    self.dismiss()
  }
  
  class func show(clothesType:PopViewType)->YZPopupView{
    let popView = YZPopupView(frame: UIScreen.mainScreen().bounds, clothesType: clothesType)
    
    (UIApplication.sharedApplication().delegate as! AppDelegate).window?.addSubview(popView)
    
    popView.present()
    return popView
  }
  
  func present(){
    
    let contentTransYAnimate = springTransYAnimationFor(contentView, transY: -310)
    let scaleAnime = springScaleAnimationFor(contentView, fromScaleXY: CGSize(width: 0.1, height: 0.1))
    
    let alphaAnime = basicAlphaAnimationFor(nil, alpha: 0.5)
//    contentView.autoresizesSubviews = true

    
    contentView.pop_addAnimation(contentTransYAnimate, forKey: "transYAnime")
    contentView.pop_addAnimation(scaleAnime, forKey: "scaleXY")
    barrierView.pop_addAnimation(alphaAnime, forKey: "alphaAnima")
  }
  
  
  
  //MARK: - 动画方法
  func springTransYAnimationFor(view:UIView, transY:CGFloat) -> POPSpringAnimation {
    var layer = view.layer
    let transYAnime = POPSpringAnimation()
    transYAnime.property = POPAnimatableProperty.propertyWithName(kPOPLayerPositionY) as! POPAnimatableProperty
    transYAnime.toValue =  layer.position.y + transY
    print(screenSize.height + transY)
    print(transY)
    print(screenSize.height)
    transYAnime.completionBlock = { (animation, finish) in
      print("PopupViewTransFinished")
      print(self.contentView.frame.origin.y)
      
    }
    return transYAnime
    
  }
  
  func springScaleAnimationFor(view:UIView, fromScaleXY:CGSize) -> POPSpringAnimation {
    
    let scaleAnime = POPSpringAnimation()
    scaleAnime.property = POPAnimatableProperty.propertyWithName(kPOPViewScaleXY) as! POPAnimatableProperty
    scaleAnime.springBounciness = 12
    scaleAnime.springSpeed = 20
    scaleAnime.fromValue = NSValue(CGSize: fromScaleXY)
    scaleAnime.toValue  = NSValue(CGSize: CGSize(width: 1.0, height: 1.0))
    
    return scaleAnime
  }
  
  func basicAlphaAnimationFor(view:UIView?, alpha: CGFloat) -> POPBasicAnimation {
    let alphaAnime = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
    
    alphaAnime.toValue = alpha
    alphaAnime.duration = 0.3
    alphaAnime.delegate = self
    
    return alphaAnime
  }
}


