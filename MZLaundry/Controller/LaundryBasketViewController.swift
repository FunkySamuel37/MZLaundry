//
//  LaundryBasketViewController.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/5.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class LaundryBasketViewController: UIViewController {
  
  @IBOutlet weak var isCartEmptyImage: UIImageView!
  @IBOutlet weak var cartTableView: UITableView!
  let cartSingleton = CartSingleton.sharedInstance
  let reusableCellId = "CartCell"
  var totalPriceLabel:UILabel?
  override func viewDidLoad() {
    super.viewDidLoad()
    print("LaundryBasketViewController Loaded")
    cartTableView.delegate = self
    cartTableView.dataSource = self
    cartTableView.allowsSelection = false
    cartTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 0))
//    cartTableView.registerClass(CartTableViewCell.self, forCellReuseIdentifier: "CartCell")
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(animated: Bool) {
    self.cartTableView.reloadData()
    self.refreshTotalPrice()
    self.isCartEmptyImage.hidden = self.cartSingleton.cartItemArray.count != 0 ? true : false

    
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

extension LaundryBasketViewController: UITableViewDelegate {
  
}

extension LaundryBasketViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cartSingleton.cartItemArray.count == 0 ? 0 : cartSingleton.cartItemArray.count + 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    if indexPath.row != self.cartSingleton.cartItemArray.count {
      
    }
    switch indexPath.row {
    case 0..<self.cartSingleton.cartItemArray.count :
      var cartItemCell = CartTableViewCell()
      if let cell = tableView.dequeueReusableCellWithIdentifier(reusableCellId, forIndexPath: indexPath) as? CartTableViewCell{
        cartItemCell = cell
      }
      let itemInfo = self.cartSingleton.cartItemArray[indexPath.row]
      cartItemCell.backGroundImage.image = UIImage(named: itemInfo.type.backGroundImage)
      cartItemCell.itemImage.image = UIImage(named: itemInfo.type.image)
      cartItemCell.itemName.text = itemInfo.type.name
      cartItemCell.price.text = "¥" + itemInfo.type.price
      cartItemCell.deleteItemBtn.addTarget(self, action: "deleteItem:", forControlEvents: UIControlEvents.TouchUpInside)
      cartItemCell.myStepper.count = itemInfo.count
      cartItemCell.myStepper.item = itemInfo
      cartItemCell.myStepper.countChangeDelegate = self
      
      return cartItemCell
      
    case self.cartSingleton.cartItemArray.count :
      var totalPriceCell = UITableViewCell()
      if let cell = tableView.dequeueReusableCellWithIdentifier("totalPriceCell", forIndexPath: indexPath) as? UITableViewCell{
        totalPriceCell = cell
        let totalPriceLabel = totalPriceCell.contentView.viewWithTag(1) as! UILabel
        self.totalPriceLabel = totalPriceLabel
      }
      return totalPriceCell
    default : return UITableViewCell()
    }
    
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if indexPath.section == 0 {
      if indexPath.row != self.cartSingleton.cartItemArray.count {
        return 90
      } else {
        return 45
      }
    } else {
      return 45
    }
  }
  
  func deleteItem(sender: UIButton){
    if self.cartTableView.numberOfRowsInSection(0) == 2 {
      self.cartSingleton.cartItemArray.removeAtIndex(0)

      let firstIndexPath = NSIndexPath(forItem: 0, inSection: 0)
      let totalCellIndexPath = NSIndexPath(forItem: 1, inSection: 0)
      self.cartTableView.deleteRowsAtIndexPaths([firstIndexPath, totalCellIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    }else {
      let cell = sender.superview?.superview as! CartTableViewCell
      let indexpath = self.cartTableView.indexPathForCell(cell)
      self.cartSingleton.cartItemArray.removeAtIndex(indexpath!.row)
      self.cartTableView.deleteRowsAtIndexPaths([indexpath!], withRowAnimation: UITableViewRowAnimation.Fade)
    }
    self.refreshTotalPrice()
    
    self.isCartEmptyImage.hidden = self.cartSingleton.cartItemArray.count != 0 ? true : false

  }
  

}

extension LaundryBasketViewController: CountChangeDelegate {
  func countChange() {
    self.refreshTotalPrice()
  }
  
  func refreshTotalPrice() {
    var totalPrice = 0
    for item in self.cartSingleton.cartItemArray {
      totalPrice += Int(item.type.price)! * item.count
    }
    self.totalPriceLabel?.text = "¥\(totalPrice)"
  }
}
