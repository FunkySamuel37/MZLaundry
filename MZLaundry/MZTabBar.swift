//
//  MZTabBar.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/10/17.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class MZTabBar: UITabBar {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.selectedImageTintColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
