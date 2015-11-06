//
//  YZPopupView.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/2.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

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
    var stepper: MyStepper!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
    }
    
    convenience init(frame: CGRect,clothesType: PopViewType){
        self.init(frame: frame)
        self.type = clothesType
        setupViews()
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
        clothBackImageView.image       = UIImage(named: type.backGroundImage)
        contentView.addSubview(clothBackImageView)
        
        //clothImageView
        let clothBackFrame             = clothBackImageView.bounds
        clothImageView                 = UIImageView(frame: CGRect(x: (clothBackFrame.width - 70) / 2, y: (clothBackFrame.height - 90) / 2, width: 70, height: 90))
        clothImageView.image           = UIImage(named: type.image)
        clothBackImageView.addSubview(clothImageView)
        
        //nameLabel
        nameLabel                      = UILabel(frame: CGRect(x: 125 + 10 , y: 20, width: 70, height: 25))
        nameLabel.textAlignment        = NSTextAlignment.Left
        nameLabel.text                 = type.name
        nameLabel.font                 = UIFont(name: "STHeitiTC-Light", size: 20)
        contentView.addSubview(nameLabel)

        //priceLabel
        priceLabel                     = UILabel(frame: CGRect(x: 125 + 10 , y: 55, width: 50, height: 25))
        priceLabel.text                = "¥" + type.price
        priceLabel.font                = UIFont(name: "MicrosoftYaHei", size: 22)
        priceLabel.textColor           = UIColor.getCustOrangeColor()
        priceLabel.sizeToFit()
        contentView.addSubview(priceLabel)

        //moduleLabel
        moduleLabel                    = UILabel(frame: CGRect(x: 125 + 10 + priceLabel.frame.width, y: 64, width: 50, height: 25))
        moduleLabel.text               = type.module
        moduleLabel.font               = UIFont(name: "STHeitiTC-Light", size: 15)
        moduleLabel.sizeToFit()
        contentView.addSubview(moduleLabel)

        //descLabel
        descLabel                      = UILabel(frame: CGRect(x: 125 + 10 , y: 98, width: contentView.frame.width - 135 - 25, height: 50))
        descLabel.text                 = type.desc
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
        contentView.addSubview(addCartButton)
        
        stepper = MyStepper(frame: CGRect(x: (contentView.frame.width - 180) / 2, y: contentView.frame.height - addCartButton.frame.height - 45 - 23, width: 180, height: 45))
        
        contentView.addSubview(stepper)
    }
    
    func dismiss(){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.contentView.frame.origin.y += 310
            self.barrierView.alpha -= 0.5
            }) { (finished) -> Void in
               self.removeFromSuperview() 
        }
        
    }
    
    class func show(clothesType:PopViewType){
        let popView = YZPopupView(frame: UIScreen.mainScreen().bounds, clothesType: clothesType)
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).window?.addSubview(popView)
        
        popView.present()
    }
    
    func present(){
        UIView.animateWithDuration(0.3) { () -> Void in
            self.contentView.frame.origin.y -= 310
            self.barrierView.alpha += 0.5
        }
    }
}
