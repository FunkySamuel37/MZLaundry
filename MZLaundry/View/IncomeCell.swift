//
//  IncomeCell.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/1.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class IncomeCell: UITableViewCell {

    @IBOutlet weak var orderId: UILabel!
    @IBOutlet weak var orderAmount: UILabel!
    @IBOutlet weak var income: UILabel!
    @IBOutlet weak var completeDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
