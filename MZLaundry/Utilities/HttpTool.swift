//
//  HttpTool.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/10/17.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HttpTool {

    class var sharedInstance: HttpTool {
        
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: HttpTool? = nil
        }
        
        dispatch_once(&Static.onceToken){
            Static.instance = HttpTool()
        }
        
        return Static.instance!
    }
    
    private func getRequest(url: String, parameters: [String: AnyObject]?, completionHandler: ( NSData?, NSError?) -> Void){
        print("2")
        Alamofire.request(.GET, NetInfo.WEB_SERVER + url, parameters: parameters, encoding: ParameterEncoding.URL).response { (_, _, data, error) -> Void in
            print("3")
             completionHandler(data, error)
        }
    }
    
    //请求广告数据
    
    func getAdInfo(completionHandler: (urls: [String]) -> Void){
        print("1")
        self.getRequest(NetInfo.GET_ADS_DATA, parameters: nil) { (data, error) -> Void in
            print("4")
            if (error == nil){
                //如果没错就开始解析JSON
                let json    = JSON(data: data as NSData!)
                let ads     = json["ads"]
                var address = [String]()
                for i in 0..<ads.count {
                    if let imageAddress = ads[i]["image"].string{
                        address.append(imageAddress)
                    }
                }
                //解析完成后通过闭包将address回传给调用方
                completionHandler(urls: address)
                
            }
        }
    }
    
    func getIncomeInfo(completionHandler: (incomeInfo: [String: AnyObject])->Void){
        
        self.getRequest(NetInfo.GET_INCOME_INFO, parameters: nil) { (data, error) -> Void in
            
            if error == nil{
                
//                do{
//                    let dataDic = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
////                    print(dataDic)
//                    let baseSalary   = dataDic.objectForKey("yearlyIncome") as! Int
//                    let balancing    = dataDic.objectForKey("balancing") as! Bool
//                    let yearlyIncome = dataDic.objectForKey("yearlyIncome") as! Int
//                    let dailyIncome  = dataDic.objectForKey("dailyIncome") as! NSArray
//                    
//                }catch{
//                    
//                }
                
                let json = JSON(data: data!)
                let yearlyIncome = json["yearlyIncome"].intValue
                let balancing = json["balancing"].boolValue
                print(balancing)
            }
            
        }
    }
    
}
