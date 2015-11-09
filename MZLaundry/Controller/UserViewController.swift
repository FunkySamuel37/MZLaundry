//
//  UserViewController.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/10/18.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
  
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var userPhoneNumLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    let phoneNum = NSUserDefaults.standardUserDefaults().valueForKey("userPhoneNumber")//("userPhoneNumber")
    if phoneNum != nil{
      userPhoneNumLabel.text = String(phoneNum!)
    }
    
    self.initialize()
    
    let cartSingleton = CartSingleton.sharedInstance

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
  
  func initialize(){
    
  }

  @IBAction func goMyIncomeVC(sender: AnyObject) {
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MZIncomeController")
    self.presentViewController(vc, animated: true) { () -> Void in
      
    }
  }
}
