//
//  MZIncomeController.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/10/31.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class MZIncomeController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var incomeInfo:IncomeInfo?
    let weekArray = ["周日","周一","周二","周三","周四","周五","周六"]
    override func viewDidLoad() {
        super.viewDidLoad()

        HttpTool.sharedInstance.getIncomeInfo { (incomeInfo) -> Void in
            self.incomeInfo = incomeInfo
            self.tableView.reloadData()
        }
    }

    override func viewDidAppear(animated: Bool) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MZIncomeController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.incomeInfo == nil ? 0 : self.incomeInfo!.dailyIncome.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.incomeInfo == nil ? 0 : self.incomeInfo!.dailyIncome[section].orders.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let orderInfo = self.incomeInfo?.dailyIncome[indexPath.section].orders[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("orderinfocell") as? IncomeCell
        
        cell!.orderId.text      = orderInfo?.orderId
        cell!.orderAmount.text  = String(orderInfo!.orderAmount) + "元"
        cell!.income.text       = String(orderInfo!.income) + "元"
        cell!.completeDate.text = (self.incomeInfo?.dailyIncome[indexPath.section].date)! + (orderInfo?.time)!
        
        return cell!
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if self.incomeInfo == nil {
            return nil
        } else {
            let dateString = self.incomeInfo?.dailyIncome[section].date
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.dateFromString(dateString!)
            
            var comp: NSDateComponents = NSCalendar.autoupdatingCurrentCalendar().components(NSCalendarUnit.NSWeekdayCalendarUnit, fromDate: date!)
            
            let dateForShowFormat = NSDateFormatter()
            dateForShowFormat.dateFormat = "dd日"
            let newDateString = "\(dateForShowFormat.stringFromDate(date!))(\(self.weekArray[comp.weekday]))"
            return newDateString
        }
//        return self.incomeInfo == nil ? nil : self.incomeInfo?.dailyIncome[section].date
    }
}
