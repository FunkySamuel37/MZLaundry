//
//  IncomeInfo.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/1.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class IncomeInfo: NSObject {
    var yearlyIncome:Int = 0
    var balancing:Bool = false
    var baseSalary:Int = 0
    var dailyIncome:[DailyIncomeInfo] = []
}
