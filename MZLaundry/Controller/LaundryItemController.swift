//
//  LaundryItemController.swift
//  MZLaundry
//
//  Created by Samuel37 on 15/11/3.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class LaundryItemController: UIViewController {
  var clothesSegment: CustomSegement!
  let screenSize = UIScreen.mainScreen().bounds
  let reuseIdentifier = "laundryItem"
  let cartSingleton = CartSingleton.sharedInstance
  
  var typeInfoArray = [PopViewType(name: "T恤", price: "8", desc: "短袖T恤，短袖衬衫", image: "clothes_0"), PopViewType(name: "衬衣", price: "8", desc: "短袖T恤，短袖衬衫", image: "clothes_1"), PopViewType(name: "长风衣", price: "12", desc: "短袖T恤，短袖衬衫", image: "clothes_2"), PopViewType(name: "短风衣", price: "18", desc: "短袖T恤，短袖衬衫", image: "clothes_3"), PopViewType(name: "外套", price: "15", desc: "短袖T恤，短袖衬衫", image: "clothes_4")]
  @IBOutlet weak var laundryItemCollection: UICollectionView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    laundryItemCollection.registerClass(LaundryCell.self, forCellWithReuseIdentifier: "laundryItem")
    laundryItemCollection.dataSource = self
    laundryItemCollection.delegate = self
    setupView()
    
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setupView(){
    
    self.clothesSegment = CustomSegement(frame: CGRect(x: 0, y: 64, width: self.screenSize.width, height: 44))
    self.view.addSubview(clothesSegment)
  }
  
  
  @IBAction func dismissSelfVC(sender: AnyObject) {
    
    self.dismissViewControllerAnimated(true) { () -> Void in
      
    }
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

//MARK: - DataSource
extension LaundryItemController: UICollectionViewDataSource {
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return typeInfoArray.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! LaundryCell
    cell.typeInfo = self.typeInfoArray[indexPath.row]
    cell.typeLabel.text =  cell.typeInfo!.name
    cell.priceLabel.text = cell.typeInfo!.price + "¥"
    cell.imageView.image = UIImage(named: cell.typeInfo!.image)
    cell.backgroundColor = UIColor.whiteColor()
    
    
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let type = (collectionView.cellForItemAtIndexPath(indexPath) as! LaundryCell).typeInfo!
    
    let popView = YZPopupView.show(type)
    popView.delegate = self
  }
  
}
//MARK: - Layout
extension LaundryItemController: UICollectionViewDelegateFlowLayout {
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let width = (screenSize.width - 30 - 10) / 2
    let height = width * CGFloat(160.0 / 140.0)
    return CGSize(width: width, height: height)
  }
}

extension LaundryItemController:AddToCartDelegate{
  func addToCart(item:PopViewType,count:Int) {
    self.cartSingleton.storeCartInfo(item, count: count)
    
    print(cartSingleton.cartItemArray.count)
  }
}
