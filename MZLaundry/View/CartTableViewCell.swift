//
//  CartTableViewCell.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/8.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var backGroundImage: UIImageView!
  
  @IBOutlet weak var itemImage: UIImageView!
  @IBOutlet weak var itemName: UILabel!
  @IBOutlet weak var myStepper: MyStepper!
  @IBOutlet weak var price: UILabel!
  @IBOutlet weak var deleteItemBtn: UIButton!
  
  
  //  var name:String   = ""
  //  var image:String  = ""
  //  var price:String  = ""
  //  var desc:String   = ""
  //  var backGroundImage:String
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  @IBAction func deleteBtnClicked(sender: AnyObject) {
  }
  
}
