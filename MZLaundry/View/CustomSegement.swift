//
//  CustomSegement.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/3.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class CustomSegement: UIView {
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    private var buttonArray:[UIButton] = []
    private var selectedIndex = 0
    private var indexView:UIView!
    override func drawRect(rect: CGRect) {
        
        let linePath = UIBezierPath()
        
        linePath.moveToPoint(CGPoint(x: rect.width/4-0.5, y: 0.0))
        linePath.addLineToPoint(CGPoint(x: rect.width/4-0.5, y: rect.height))
        
        linePath.moveToPoint(CGPoint(x: rect.width/4 * 2 - 0.5, y: 0.0))
        linePath.addLineToPoint(CGPoint(x: rect.width/4 * 2 - 0.5, y: rect.height))
        
        linePath.moveToPoint(CGPoint(x: rect.width/4 * 3 - 0.5, y: 0.0))
        linePath.addLineToPoint(CGPoint(x: rect.width/4 * 3 - 0.5, y: rect.height))
        
        linePath.moveToPoint(CGPoint(x: rect.origin.x, y: 1.0))
        linePath.addLineToPoint(CGPoint(x: rect.width, y: 1.0))
        
        UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1.0).setStroke()
        linePath.lineWidth = 1.0
        linePath.stroke()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView(){
        
        self.backgroundColor = UIColor.whiteColor()
        let title = ["春／秋装","夏装","冬装","皮衣"]
        
        for i in 0..<4 {
            let button = UIButton(frame: CGRect(x: frame.width / 4.0 * CGFloat(i), y: 0, width: frame.width / 4.0, height: frame.height))
            button.setTitle(title[i], forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.setTitleColor(UIColor(red: 40.0 / 255.0, green: 204.0 / 255.0, blue: 252.0 / 255.0, alpha: 1), forState: UIControlState.Selected)
            
            button.titleLabel?.font = UIFont(name: "STHeitiTC-Light", size: 16)
            button.tag = i
            button.addTarget(self, action: "buttonSelected:", forControlEvents: UIControlEvents.TouchUpInside)
            self.buttonArray.append(button)
            self.addSubview(button)
            
        }
        
        buttonArray[0].selected = true
        
        self.indexView = UIView(frame: CGRect(x: 0, y: frame.height - 5.0, width: frame.width / 4.0, height: 5.0))
        indexView.backgroundColor = UIColor(red: 40.0 / 255.0, green: 204.0 / 255.0, blue: 252.0 / 255.0, alpha: 1)
        self.addSubview(indexView)
    }
    
    func buttonSelected(sender:UIButton){
        self.selectedIndex = sender.tag
        
        for button in buttonArray{
            if button != sender {
                button.selected = false
            } else {
                button.selected = true
            }
        }
        
        UIView.animateKeyframesWithDuration(0.3, delay: 0.0, options: UIViewKeyframeAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            
                self.indexView.frame.origin.x = CGFloat(self.selectedIndex) * self.frame.width / 4.0
            }) { (finish) -> Void in
                
        }
        
        
    }
    
    
    
    
}
