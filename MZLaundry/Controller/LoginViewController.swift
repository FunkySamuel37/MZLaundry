//
//  LoginViewController.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/10/13.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit
import CXCardView

class LoginViewController: UIViewController {

    @IBOutlet weak var phoneNumField: UITextField!
    @IBOutlet weak var veriField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupViews(){
        let phoneNumleftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        
        self.phoneNumField.layer.borderWidth = 1.0
        self.phoneNumField.layer.borderColor = UIColor.getLightGrayBorderColor().CGColor
        self.phoneNumField.leftView = phoneNumleftView
        self.phoneNumField.leftViewMode = UITextFieldViewMode.Always
        
        let veriFieldleftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))

        self.veriField.layer.borderWidth = 1.0
        self.veriField.layer.borderColor = UIColor.getLightGrayBorderColor().CGColor
        self.veriField.leftView = veriFieldleftView
        self.veriField.leftViewMode = UITextFieldViewMode.Always
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
    //MARK: Action functions
    extension LoginViewController{
    @IBAction func closeTheKeyboard(sender: AnyObject) {
        self.phoneNumField.resignFirstResponder()
        self.veriField.resignFirstResponder()
    }
    
    @IBAction func getVeriCode(sender: AnyObject) {
        
        self.closeTheKeyboard(sender)
        let cardView = CustomContentView.defaultView()
        cardView.setup()
        cardView.dismissHandler = {(view:UIView)-> Void in
            
            CXCardView.dismissCurrent()
        }
        var descriptionLabel             = UILabel()
        descriptionLabel.frame           = CGRectMake(20, 8, 260, 100)
        descriptionLabel.numberOfLines   = 0
        descriptionLabel.textAlignment   = NSTextAlignment.Center
        descriptionLabel.backgroundColor = UIColor.clearColor()
        descriptionLabel.textColor       = UIColor.blackColor()
        descriptionLabel.font            = UIFont(name: "Avenir-Roman", size: 14)
        descriptionLabel.text            = "确认绑定此手机号码:"+self.phoneNumField.text!
        cardView.addSubview(descriptionLabel)
        
        cardView._dismissButton.setTitle("确认", forState: UIControlState.Normal)
        
        CXCardView.showWithView(cardView, draggable: false)
    }
    
    @IBAction func loginWithPhoneNumber(sender: AnyObject) {
        if self.phoneNumField.text != nil && self.phoneNumField.text != "" {
            NSUserDefaults.standardUserDefaults().setInteger(Int(phoneNumField.text!)!, forKey: "userPhoneNumber")
            NSUserDefaults.standardUserDefaults().synchronize()//同步数据
            //            print(Int(phoneNumField.text!))
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tabBarViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func backToSplashScreen(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
