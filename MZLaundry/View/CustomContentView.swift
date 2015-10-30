//
//  CustomContentView.swift
//  CXCardViewDemo
//
//  Created by Samuel37 on 15/10/29.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class CustomContentView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var _backgroundView:UIView!
    var _dismissButton:UIButton!
    var _decriptionLabel:UILabel!
    
    var dismissHandler:((view:UIView)-> Void)!
//    init () {
//        super.init()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    class func defaultView()-> CustomContentView{
        let view = CustomContentView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 150)
        
        return view
    }
    
    func setup(){
        self.backgroundColor = UIColor.clearColor()
        
        self.layer.cornerRadius = 2.0
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
        self.layer.shadowColor = UIColor.whiteColor().CGColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.0
        
        self._backgroundView = UIView(frame: self.bounds)
        self._backgroundView.alpha = 0.8
        self._backgroundView.backgroundColor = UIColor.whiteColor()
        self.addSubview(_backgroundView)
        
        self._dismissButton = UIButton(frame: CGRect(x: 0, y: 110, width: 300, height: 40))
        self._dismissButton.backgroundColor = UIColor.getLightGrayBorderColor()
        self._dismissButton.setTitle("Dissmiss", forState: UIControlState.Normal)
        self._dismissButton.titleLabel?.textColor = UIColor.whiteColor()
        self._dismissButton.addTarget(self, action: "dismissBtnPressed", forControlEvents: .TouchUpInside)
        self.addSubview(self._dismissButton)
        
    }
    
    func dismissBtnPressed(){
        self.dismissHandler(view: self)
    }

    
}
